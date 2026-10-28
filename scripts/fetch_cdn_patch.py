#!/usr/bin/env python3
"""从原服 CDN 镜像客户端补丁资源到本地 cdn/ 目录。

用法：
    python scripts/fetch_cdn_patch.py                # 下载从当前 APK 版本到最新版的增量
    python scripts/fetch_cdn_patch.py --workers 6
    python scripts/fetch_cdn_patch.py --cdn http://106.52.8.88:81/xcqy_dev

产物结构：
    cdn/patch_android/patch_list.json
    cdn/patch_android/<version>/version.json
    cdn/patch_android/<patchVersion>/<target>
    cdn/delta_manifest.json   （本次增量清单）
"""

import argparse
import hashlib
import json
import lzma
import sys
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path, PurePosixPath
from urllib.request import Request, urlopen

ROOT = Path(__file__).resolve().parent.parent
DEFAULT_CDN = "http://106.52.8.88:81/xcqy_dev"


def get(url, timeout=60, retries=3):
    last = None
    for i in range(retries):
        try:
            req = Request(url, headers={"User-Agent": "xcqy-local/1.0"})
            with urlopen(req, timeout=timeout) as resp:
                return resp.read()
        except Exception as exc:
            last = exc
            time.sleep(1 + i)
    raise last


def load_manifest(raw):
    text = lzma.decompress(raw).decode("utf-8")
    return json.loads(text.lstrip("\ufeff \r\n\t"))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--cdn", default=DEFAULT_CDN)
    parser.add_argument("--out", default=str(ROOT / "cdn"))
    parser.add_argument("--workers", type=int, default=4)
    parser.add_argument("--skip-verify", action="store_true")
    args = parser.parse_args()

    cdn = args.cdn.rstrip("/")
    out = Path(args.out)
    local_manifest_path = ROOT / "extracted" / "assets" / "version.json"
    if not local_manifest_path.is_file():
        raise SystemExit("缺少 extracted/assets/version.json，先运行 python scripts/extract_assets.py")

    base_raw = get(cdn + "/android/base_setting.json")
    base = json.loads(base_raw.decode("utf-8-sig"))
    latest = base["res_version"]
    print("原服最新 res_version:", latest)

    plist_raw = get(cdn + "/patch_android/patch_list.json")
    plist = json.loads(plist_raw.decode("utf-8-sig"))
    print("补丁版本数:", len(plist))

    latest_raw = get(f"{cdn}/patch_android/{latest}/version.json")
    latest_manifest = load_manifest(latest_raw)
    local_manifest = load_manifest(local_manifest_path.read_bytes())
    local_by_target = {e["target"]: e for e in local_manifest}
    delta = [
        e for e in latest_manifest
        if e["target"] not in local_by_target or local_by_target[e["target"]]["md5"] != e["md5"]
    ]
    total_bytes = sum(int(e["size"]) for e in delta)
    print(f"需要下载 {len(delta)} 个文件，共 {total_bytes / 1048576:.1f} MB")

    pd = out / "patch_android"
    pd.mkdir(parents=True, exist_ok=True)
    (pd / "patch_list.json").write_bytes(plist_raw)
    vdir = pd / latest
    vdir.mkdir(parents=True, exist_ok=True)
    (vdir / "version.json").write_bytes(latest_raw)
    (out / "base_setting_live.json").write_bytes(base_raw)
    (out / "delta_manifest.json").write_text(json.dumps(delta, ensure_ascii=False, indent=1), encoding="utf-8")
    (out / "res_version.txt").write_text(latest + "\n", encoding="utf-8")

    def download(entry):
        target = entry["target"]
        rel = PurePosixPath(target)
        if rel.is_absolute() or ".." in rel.parts:
            raise ValueError("非法 target: " + target)
        dest = pd / entry["patchVersion"] / Path(*rel.parts)
        size = int(entry["size"])
        if dest.is_file() and dest.stat().st_size == size:
            if args.skip_verify or hashlib.md5(dest.read_bytes()).hexdigest() == entry["md5"]:
                return entry, "skip", 0
        dest.parent.mkdir(parents=True, exist_ok=True)
        data = get(f"{cdn}/patch_android/{entry['patchVersion']}/{target}")
        if len(data) != size:
            raise ValueError(f"size {len(data)} != {size}")
        if not args.skip_verify and hashlib.md5(data).hexdigest() != entry["md5"]:
            raise ValueError("md5 mismatch")
        tmp = dest.with_name(dest.name + ".part")
        tmp.write_bytes(data)
        tmp.replace(dest)
        return entry, "ok", len(data)

    done = 0
    downloaded_bytes = 0
    failures = []
    with ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = {pool.submit(download, e): e for e in delta}
        for fut in as_completed(futures):
            entry = futures[fut]
            try:
                _, status, size = fut.result()
                done += 1
                downloaded_bytes += size
                if done % 100 == 0:
                    print(f"  {done}/{len(delta)}  {downloaded_bytes / 1048576:.1f} MB", flush=True)
            except Exception as exc:
                failures.append((entry["target"], repr(exc)))
                print("FAIL", entry["target"], exc, flush=True)

    print(f"完成 {done}/{len(delta)}，本次下载 {downloaded_bytes / 1048576:.1f} MB，失败 {len(failures)}")
    if failures:
        (out / "failures.txt").write_text("\n".join(f"{t} {r}" for t, r in failures), encoding="utf-8")
        sys.exit(1)


if __name__ == "__main__":
    main()
