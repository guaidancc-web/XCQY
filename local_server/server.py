import json
import os
import socket
import socketserver
import struct
import threading
import time
import urllib.parse
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

import protocol

BASE = Path(__file__).resolve().parent.parent
ASSETS = BASE / "extracted" / "assets"
LOG_DIR = Path(__file__).resolve().parent
PUBLIC_HOST = os.environ.get("PUBLIC_HOST", "127.0.0.1")
HTTP_PORT = int(os.environ.get("HTTP_PORT", "81"))
TCP_PORT = int(os.environ.get("TCP_PORT", "8001"))
RESPOND_ALL = os.environ.get("RESPOND_ALL", "1") == "1"
ENABLE_TCP = os.environ.get("ENABLE_TCP", "1") == "1"
HANDSHAKE = b"game_client------------"

RECV_SCHEMAS, SEND_SCHEMAS = protocol.load_protocols(BASE / "lua_decoded" / "data" / "data_protocol.lua")

ROLE = {
    "id": 1,
    "platform": "dev",
    "zone_id": 1,
    "name": "本地测试",
    "sex": 1,
    "classes": 1,
    "lev": 1,
    "vip_lev": 0,
    "gold": 0,
    "time_reg": int(time.time()),
}

_print_lock = threading.Lock()


def log(tag, message):
    line = f"[{time.strftime('%H:%M:%S')}] [{tag}] {message}"
    with _print_lock:
        print(line, flush=True)
        try:
            with open(LOG_DIR / f"{tag.lower()}.log", "a", encoding="utf-8") as fh:
                fh.write(line + "\n")
        except OSError:
            pass


def local_base_setting():
    return {
        "debug": "false",
        "editor": "false",
        "apk_version": "15122615",
        "remote_log": "false",
        "server_list_path": f"http://{PUBLIC_HOST}:{HTTP_PORT}/list.php",
        "check_apk": "true",
        "check_apk_path": f"http://{PUBLIC_HOST}:{HTTP_PORT}/apkcheck",
        "res_version": "2021004090734",
        "cdn_path": f"http://{PUBLIC_HOST}:{HTTP_PORT}/xcqy_dev",
        "download_apk_path": f"http://{PUBLIC_HOST}:{HTTP_PORT}/res/apk",
        "first_cdn_path": f"http://{PUBLIC_HOST}:{HTTP_PORT}/xcqy_dev",
    }


def server_list():
    server = {
        "name": "本地测试服",
        "host": PUBLIC_HOST,
        "port": TCP_PORT,
        "platform": "dev",
        "zone_id": 1,
        "begin_time": 1700000000,
        "end_time": 2000000000,
        "first_zone": "1",
        "recomend": "1",
        "isnew": "0",
        "hot": "1",
        "roles": [],
    }
    return {"error": "0", "msg": {"server_list": [server], "default_zone": server}}


class Handler(BaseHTTPRequestHandler):
    server_version = "xcqy-local/0.1"

    def log_message(self, fmt, *args):
        log("HTTP", f"{self.client_address[0]} {fmt % args}")

    def _send(self, code, body, content_type="application/json; charset=utf-8", extra_headers=None):
        if isinstance(body, (dict, list)):
            body = json.dumps(body, ensure_ascii=False).encode("utf-8")
        elif isinstance(body, str):
            body = body.encode("utf-8")
        self.send_response(code)
        self.send_header("Content-Type", content_type)
        self.send_header("Content-Length", str(len(body)))
        self.send_header("Cache-Control", "no-store")
        self.send_header("Access-Control-Allow-Origin", "*")
        for key, value in (extra_headers or {}).items():
            self.send_header(key, value)
        self.close_connection = True
        self.end_headers()
        if self.command != "HEAD":
            self.wfile.write(body)

    def do_HEAD(self):
        self.do_GET()

    def do_GET(self):
        parsed = urllib.parse.urlparse(self.path)
        path = parsed.path
        log("HTTP", f"{self.command} {path}?{parsed.query[:200]}")

        if path in ("/", "/health"):
            self._send(200, {"ok": True, "service": "xcqy-local", "tcp_port": TCP_PORT})
            return

        if path.endswith("/base_setting.json"):
            self._send(200, local_base_setting())
            return

        if path in ("/list.php", "/list", "/list/", "/xcqy_dev/list.php", "/xcqy_dev/list/"):
            body = json.dumps(server_list(), ensure_ascii=False)
            log("HTTP", f"LIST serve ua={self.headers.get('User-Agent', '')!r} len={len(body)} body={body[:260]}")
            self._send(200, body)
            return

        if path in ("/login/checkAccount.php", "/login/checkaccount.php", "/xcqy_dev/login/checkAccount.php"):
            query = urllib.parse.parse_qs(parsed.query)
            account = (query.get("account") or [""])[0]
            log("LOGIN", f"account={account!r} password=<redacted> client={self.client_address[0]}")
            self._send(200, {
                "msg": json.dumps({"success": "true", "channel": "local"}, ensure_ascii=False),
                "sing": json.dumps({"sign": "local"}, ensure_ascii=False),
            })
            return

        if path.endswith("/patch_list.json"):
            file_path = ASSETS / "patch_list.json"
            self._send(200, file_path.read_bytes() if file_path.exists() else b"[]")
            return

        if path.endswith("/version.json"):
            file_path = ASSETS / "version.json"
            if file_path.exists():
                self._send(200, file_path.read_bytes(), "application/octet-stream")
            else:
                self._send(404, {"error": "missing version.json"})
            return

        if path.startswith(("/index.php/device/activation", "/index.php/entry/step", "/index.php/ChannelBag/bag")):
            # utils_base telemetry (ActiveDevice / NewPlayerImport). The callback expects
            # resultData.table.success == "true" after its gsub("true", '"true"').
            self._send(200, {"table": {"success": True}})
            return

        if path.endswith("/offline_version.php"):
            # LoginManager:CheckVersion() polls this every 6s after entering the world;
            # a failed fetch pops a blocking "下载remotetxt信息失败" dialog. <10 means
            # "no client update".
            self._send(200, "0", "text/plain; charset=utf-8")
            return

        if path in ("/apkcheck", "/apkcheck/"):
            self._send(200, {"error": "0"})
            return

        if path.startswith("/xcqy_dev/"):
            rel = path[len("/xcqy_dev/"):]
            candidates = [ASSETS / rel]
            if rel.startswith(("android/", "ios/")):
                candidates.append(ASSETS / rel.split("/", 1)[1])
            file_path = None
            for candidate in candidates:
                resolved = candidate.resolve()
                try:
                    resolved.relative_to(ASSETS.resolve())
                except ValueError:
                    continue
                if resolved.is_file():
                    file_path = resolved
                    break
            if file_path is not None:
                suffix = file_path.suffix.lower()
                content_type = {
                    ".json": "application/json; charset=utf-8",
                    ".lua": "application/octet-stream",
                    ".erl": "application/octet-stream",
                    ".unity3d": "application/octet-stream",
                    ".map": "application/octet-stream",
                    ".png": "image/png",
                }.get(suffix, "application/octet-stream")
                self._send(200, file_path.read_bytes(), content_type)
            else:
                self._send(404, {"error": "not found", "path": rel})
            return

        # Any other path: log it so unexpected client polls are discoverable instead of
        # popping the blocking "下载remotetxt信息失败" dialog.
        log("HTTP", f"UNHANDLED {self.command} {self.path[:200]}")
        self._send(200, "0", "text/plain; charset=utf-8")


def _jsonable(value):
    if isinstance(value, bytes):
        return {"bytes": value.hex()[:200], "length": len(value)}
    if isinstance(value, list):
        return [_jsonable(v) for v in value]
    if isinstance(value, dict):
        return {k: _jsonable(v) for k, v in value.items()}
    return value


def _override_defaults(values, now):
    for name in list(values.keys()):
        low = name.lower()
        if name == "flag":
            values[name] = 1
        elif name in ("id", "role_id"):
            values[name] = ROLE["id"]
        elif name == "platform":
            values[name] = ROLE["platform"]
        elif name == "zone_id":
            values[name] = ROLE["zone_id"]
        elif name in ("name", "role_name"):
            values[name] = ROLE["name"]
        elif name in ("lev", "vip_lev"):
            values[name] = ROLE["lev"] if name == "lev" else 0
        elif name == "sex":
            values[name] = ROLE["sex"]
        elif name == "classes":
            values[name] = ROLE["classes"]
        elif name in ("hp", "hp_max", "mp", "mp_max"):
            values[name] = 1000
        elif name in ("time_reg", "server_time", "client_time", "time"):
            values[name] = int(now)
        elif name in ("world_lev", "map_id", "base_id", "scene_id"):
            values[name] = 1 if name == "world_lev" else 0
        elif name == "msg":
            values[name] = "OK"
    return values


class GameHandler(socketserver.BaseRequestHandler):
    def handle(self):
        peer = f"{self.client_address[0]}:{self.client_address[1]}"
        log("TCP", f"connected {peer}")
        self.request.settimeout(600)
        try:
            peek = self.request.recv(128, socket.MSG_PEEK)
            log("TCP", f"peek {len(peek)} bytes: {peek.hex()} ascii={peek!r}")
            if peek.startswith(HANDSHAKE):
                self.request.recv(len(HANDSHAKE))
                log("TCP", "handshake consumed")
        except Exception as exc:
            log("TCP", f"peek failed: {exc}")
        reader = self.request.makefile("rb")
        try:
            while True:
                frame = protocol.read_frame(reader)
                if frame is None:
                    break
                cmd, body = frame
                decoded = None
                if cmd in SEND_SCHEMAS:
                    try:
                        decoded, used = protocol.decode_fields(SEND_SCHEMAS[cmd], body)
                        if used != len(body):
                            log("TCP", f"cmd={cmd} decoded {used}/{len(body)} bytes")
                    except Exception as exc:
                        log("TCP", f"cmd={cmd} decode error: {exc}; body={body.hex()[:200]}")
                log("TCP", f"recv cmd={cmd} len={len(body)} data={json.dumps(_jsonable(decoded), ensure_ascii=False)[:1200] if decoded is not None else body.hex()[:200]}")

                now = time.time()
                if cmd == 1011:
                    self._send(1010, {"flag": 1, "msg": "欢迎", "list": []})
                elif cmd == 1100:
                    self._send(1100, {"msg": "", "role_list": [], "cdkey": 0})
                elif cmd == 1099:
                    self._send(1099, {"client_time": int(now), "server_time": int(now)})
                elif cmd == 1098:
                    self._send(1098, {"client_time": int(now), "server_time": int(now)})
                elif cmd == 1097:
                    self._send(1097, {"version": "0"})
                elif cmd == 1110:
                    if decoded:
                        ROLE["name"] = decoded.get("name") or ROLE["name"]
                        ROLE["sex"] = decoded.get("sex") or ROLE["sex"]
                        ROLE["classes"] = decoded.get("classes") or ROLE["classes"]
                        ROLE["zone_id"] = decoded.get("zone_id") or ROLE["zone_id"]
                    self._send(1110, {
                        "flag": 1, "msg": "", "id": ROLE["id"], "platform": ROLE["platform"],
                        "zone_id": ROLE["zone_id"], "name": ROLE["name"], "lev": ROLE["lev"],
                        "vip_lev": ROLE["vip_lev"], "gold": ROLE["gold"], "time_reg": ROLE["time_reg"],
                    })
                elif cmd == 1120:
                    self._send(1120, {
                        "flag": 1, "msg": "", "id": ROLE["id"], "platform": ROLE["platform"],
                        "zone_id": ROLE["zone_id"], "name": ROLE["name"], "lev": ROLE["lev"],
                        "vip_lev": ROLE["vip_lev"], "gold": ROLE["gold"], "time_reg": ROLE["time_reg"],
                    })
                elif RESPOND_ALL and cmd in RECV_SCHEMAS:
                    schema = RECV_SCHEMAS[cmd]
                    values = protocol.default_values(schema, now)
                    values = _override_defaults(values, now)
                    try:
                        self._send(cmd, values)
                    except Exception as exc:
                        log("TCP", f"cmd={cmd} encode error: {exc}")
                else:
                    log("TCP", f"cmd={cmd} no auto response (recv_schema={cmd in RECV_SCHEMAS})")
        except Exception as exc:
            log("TCP", f"connection {peer} ended: {type(exc).__name__}: {exc}")
        finally:
            try:
                reader.close()
            except Exception:
                pass
            log("TCP", f"disconnected {peer}")

    def _send(self, cmd, values):
        schema = RECV_SCHEMAS.get(cmd)
        if schema is None:
            log("TCP", f"no recv schema for response cmd={cmd}")
            return
        body = protocol.encode_fields(schema, values)
        self.request.sendall(protocol.make_frame(cmd, body))
        log("TCP", f"send cmd={cmd} len={len(body)} data={json.dumps(_jsonable(values), ensure_ascii=False)[:1200]}")


class ThreadingTCPServer(socketserver.ThreadingTCPServer):
    allow_reuse_address = True
    daemon_threads = True


def main():
    log_dir = LOG_DIR
    log_dir.mkdir(exist_ok=True)
    httpd = ThreadingHTTPServer(("0.0.0.0", HTTP_PORT), Handler)
    tcpd = ThreadingTCPServer(("0.0.0.0", TCP_PORT), GameHandler) if ENABLE_TCP else None
    log("SERVER", f"HTTP http://0.0.0.0:{HTTP_PORT}  TCP {'0.0.0.0:' + str(TCP_PORT) if ENABLE_TCP else 'disabled'}  PUBLIC_HOST={PUBLIC_HOST}")
    log("SERVER", f"recv schemas={len(RECV_SCHEMAS)} send schemas={len(SEND_SCHEMAS)} respond_all={RESPOND_ALL}")
    threading.Thread(target=httpd.serve_forever, daemon=True, name="http").start()
    try:
        if tcpd is not None:
            tcpd.serve_forever()
        else:
            threading.Event().wait()
    except KeyboardInterrupt:
        pass
    finally:
        httpd.shutdown()
        if tcpd is not None:
            tcpd.shutdown()


if __name__ == "__main__":
    main()
