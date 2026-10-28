import argparse
import shutil
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DEFAULT_APK = ROOT / "base_icon.apk"
OUT = ROOT / "extracted" / "assets"


def main():
    parser = argparse.ArgumentParser(description="从 APK 解出 HTTP 服务需要的 extracted/assets")
    parser.add_argument("--apk", default=str(DEFAULT_APK))
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    apk = Path(args.apk)
    if not apk.is_file():
        raise SystemExit(f"缺少 APK: {apk}")

    if OUT.exists() and any(OUT.iterdir()) and not args.force:
        count = sum(1 for p in OUT.rglob("*") if p.is_file())
        print(f"已存在 {OUT}（{count} 个文件），跳过。需要重建请加 --force")
        return

    count = 0
    with zipfile.ZipFile(apk) as z:
        for info in z.infolist():
            if not info.filename.startswith("assets/") or info.filename.endswith("/"):
                continue
            rel = info.filename[len("assets/"):]
            dest = OUT / rel
            dest.parent.mkdir(parents=True, exist_ok=True)
            with z.open(info) as src, open(dest, "wb") as dst:
                shutil.copyfileobj(src, dst)
            count += 1
    print(f"已解出 {count} 个文件到 {OUT}")


if __name__ == "__main__":
    main()
