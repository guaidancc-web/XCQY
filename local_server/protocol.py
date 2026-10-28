import struct
from pathlib import Path

INT_TYPES = {
    "int8": ("<b", 1),
    "uint8": ("<B", 1),
    "int16": ("<h", 2),
    "uint16": ("<H", 2),
    "int32": ("<i", 4),
    "uint32": ("<I", 4),
}


class _LuaParser:
    def __init__(self, text, pos=0):
        self.text = text
        self.pos = pos
        self.n = len(text)

    def skip(self):
        while self.pos < self.n:
            c = self.text[self.pos]
            if c in " \t\r\n":
                self.pos += 1
            elif self.text.startswith("--", self.pos):
                end = self.text.find("\n", self.pos)
                self.pos = self.n if end < 0 else end + 1
            else:
                break

    def parse_value(self):
        self.skip()
        if self.pos >= self.n:
            raise ValueError("unexpected EOF")
        c = self.text[self.pos]
        if c == "{":
            return self.parse_table()
        if c in "\"'":
            return self.parse_string()
        if c.isdigit() or c == "-":
            return self.parse_number()
        return self.parse_identifier()

    def parse_string(self):
        quote = self.text[self.pos]
        self.pos += 1
        out = []
        while self.pos < self.n:
            c = self.text[self.pos]
            self.pos += 1
            if c == quote:
                return "".join(out)
            if c == "\\":
                if self.pos >= self.n:
                    break
                e = self.text[self.pos]
                self.pos += 1
                out.append({"n": "\n", "r": "\r", "t": "\t"}.get(e, e))
            else:
                out.append(c)
        raise ValueError("unterminated string")

    def parse_number(self):
        start = self.pos
        if self.text[self.pos] == "-":
            self.pos += 1
        while self.pos < self.n and (self.text[self.pos].isdigit() or self.text[self.pos] in ".xabcdefABCDEF"):
            self.pos += 1
        raw = self.text[start:self.pos]
        if raw.lower().startswith("0x") or raw.lower().startswith("-0x"):
            return int(raw, 16)
        if "." in raw:
            return float(raw)
        return int(raw)

    def parse_identifier(self):
        start = self.pos
        while self.pos < self.n and (self.text[self.pos].isalnum() or self.text[self.pos] == "_"):
            self.pos += 1
        word = self.text[start:self.pos]
        if word == "true":
            return True
        if word == "false":
            return False
        if word == "nil":
            return None
        return word

    def parse_table(self):
        assert self.text[self.pos] == "{"
        self.pos += 1
        items = []
        mapping = {}
        while True:
            self.skip()
            if self.pos >= self.n:
                raise ValueError("unterminated table")
            if self.text[self.pos] == "}":
                self.pos += 1
                break
            if self.text[self.pos] == "[":
                self.pos += 1
                key = self.parse_value()
                self.skip()
                if self.text[self.pos] != "]":
                    raise ValueError("expected ]")
                self.pos += 1
                self.skip()
                if self.text[self.pos] != "=":
                    raise ValueError("expected =")
                self.pos += 1
                value = self.parse_value()
                mapping[key] = value
            else:
                save = self.pos
                ident = None
                if self.text[self.pos].isalpha() or self.text[self.pos] == "_":
                    ident = self.parse_identifier()
                    self.skip()
                if ident is not None and self.pos < self.n and self.text[self.pos] == "=":
                    self.pos += 1
                    mapping[ident] = self.parse_value()
                else:
                    self.pos = save
                    items.append(self.parse_value())
            self.skip()
            if self.pos < self.n and self.text[self.pos] in ",;":
                self.pos += 1
        if mapping and items:
            mapping["__items__"] = items
            return mapping
        if mapping:
            return mapping
        return items


def _find_table(text, marker):
    pos = text.index(marker) + len(marker)
    pos = text.index("=", pos) + 1
    parser = _LuaParser(text, pos)
    return parser.parse_value()


def _as_list(value):
    if isinstance(value, dict):
        int_keys = sorted(k for k in value if isinstance(k, int))
        if int_keys and len(int_keys) == len(value):
            return [value[k] for k in int_keys]
        if not value:
            return []
    return value


def _normalize_schema(schema):
    schema = _as_list(schema)
    if not isinstance(schema, list):
        return []
    for field in schema:
        if isinstance(field, dict) and "fields" in field:
            field["fields"] = _normalize_schema(field["fields"])
    return schema


def load_protocols(path):
    text = Path(path).read_text(encoding="utf-8", errors="replace")
    recv = _find_table(text, "M.recv")
    send = _find_table(text, "M.send")
    if not isinstance(recv, dict) or not isinstance(send, dict):
        raise ValueError("protocol tables are not dictionaries")
    recv = {int(k): _normalize_schema(v) for k, v in recv.items() if isinstance(k, int)}
    send = {int(k): _normalize_schema(v) for k, v in send.items() if isinstance(k, int)}
    return recv, send


def decode_fields(schema, data, offset=0):
    values = {}
    pos = offset
    for field in schema:
        name = field["name"]
        ftype = field["type"]
        if ftype in INT_TYPES:
            fmt, size = INT_TYPES[ftype]
            values[name] = struct.unpack_from(fmt, data, pos)[0]
            pos += size
        elif ftype == "string":
            length = struct.unpack_from("<H", data, pos)[0]
            pos += 2
            values[name] = data[pos:pos + length].decode("utf-8", "replace")
            pos += length
        elif ftype == "byte":
            length = struct.unpack_from("<I", data, pos)[0]
            pos += 4
            values[name] = data[pos:pos + length]
            pos += length
        elif ftype == "array":
            count = struct.unpack_from("<H", data, pos)[0]
            pos += 2
            items = []
            for _ in range(count):
                item, pos = decode_fields(field.get("fields", []), data, pos)
                items.append(item)
            values[name] = items
        else:
            raise ValueError(f"unknown field type {ftype}")
    return values, pos


def _default_value(field, key, now):
    name = field.get("name", "")
    ftype = field.get("type")
    if ftype == "string":
        if name in ("name", "role_name"):
            return "本地测试"
        if name == "platform":
            return "dev"
        if name == "msg":
            return "OK"
        return ""
    if ftype == "byte":
        return b""
    if ftype == "array":
        return []
    value = 0
    if name == "flag":
        value = 1
    elif name in ("id", "role_id"):
        value = 1
    elif name == "zone_id":
        value = 1
    elif name in ("lev", "vip_lev"):
        value = 1
    elif name == "sex":
        value = 1
    elif name == "classes":
        value = 1
    elif name in ("hp", "hp_max", "mp", "mp_max"):
        value = 1000
    elif name in ("time_reg", "time"):
        value = int(now)
    return value


def default_values(schema, now=None):
    import time
    now = time.time() if now is None else now
    values = {}
    for field in schema:
        ftype = field.get("type")
        if ftype == "array":
            values[field["name"]] = []
        elif ftype == "byte":
            values[field["name"]] = b""
        else:
            values[field["name"]] = _default_value(field, None, now)
    return values


def encode_fields(schema, values):
    out = bytearray()
    for field in schema:
        name = field["name"]
        ftype = field["type"]
        value = values.get(name)
        if ftype in INT_TYPES:
            fmt, _ = INT_TYPES[ftype]
            if value is None:
                value = 0
            out += struct.pack(fmt, int(value))
        elif ftype == "string":
            raw = ("" if value is None else str(value)).encode("utf-8")
            if len(raw) > 0xFFFF:
                raw = raw[:0xFFFF]
            out += struct.pack("<H", len(raw)) + raw
        elif ftype == "byte":
            raw = b"" if value is None else bytes(value)
            out += struct.pack("<I", len(raw)) + raw
        elif ftype == "array":
            items = [] if value is None else value
            out += struct.pack("<H", len(items))
            for item in items:
                out += encode_fields(field.get("fields", []), item)
        else:
            raise ValueError(f"unknown field type {ftype}")
    return bytes(out)


def make_frame(cmd, body):
    return struct.pack("<IH", len(body) + 2, cmd) + body


def read_frame(reader):
    header = reader.read(4)
    if len(header) < 4:
        return None
    length = struct.unpack("<I", header)[0]
    if length < 2 or length > 8 * 1024 * 1024:
        raise ValueError(f"bad frame length {length}")
    cmd_raw = reader.read(2)
    if len(cmd_raw) < 2:
        return None
    cmd = struct.unpack("<H", cmd_raw)[0]
    body = reader.read(length - 2)
    if len(body) != length - 2:
        return None
    return cmd, body
