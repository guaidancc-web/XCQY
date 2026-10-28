import shutil
import subprocess
import zipfile
from pathlib import Path

BASE = Path(__file__).resolve().parent.parent
SRC = BASE / "base_local.apk"
UNSIGNED = BASE / "base_icon_unsigned.apk"
SIGNED = BASE / "base_icon.apk"
KEYSTORE = BASE / "local_server" / "debug.keystore"
JDK_BIN = BASE / "tools" / "jdk-21.0.12.1+1" / "bin"
ICONS = BASE / "tmp" / "icons"

APP_ICON = (ICONS / "icon_app_512.png").read_bytes()
LAUNCHER = {
    "res/drawable-ldpi-v4/ic_launcher.png": (ICONS / "icon_launcher_ldpi.png").read_bytes(),
    "res/drawable-mdpi-v4/ic_launcher.png": (ICONS / "icon_launcher_mdpi.png").read_bytes(),
    "res/drawable-hdpi-v4/ic_launcher.png": (ICONS / "icon_launcher_hdpi.png").read_bytes(),
    "res/drawable-xhdpi-v4/ic_launcher.png": (ICONS / "icon_launcher_xhdpi.png").read_bytes(),
}
REPLACE = {
    "res/drawable/app_icon.png": APP_ICON,
    "res/drawable-ldpi-v4/app_icon.png": APP_ICON,
    "res/drawable-mdpi-v4/app_icon.png": APP_ICON,
    "res/drawable-hdpi-v4/app_icon.png": APP_ICON,
    "res/drawable-xhdpi-v4/app_icon.png": APP_ICON,
    "res/drawable-xxhdpi-v4/app_icon.png": APP_ICON,
    **LAUNCHER,
}


def is_signature(name):
    if not name.startswith("META-INF/"):
        return False
    if name == "META-INF/MANIFEST.MF":
        return True
    return name.endswith((".SF", ".RSA", ".DSA", ".EC"))


def main():
    if UNSIGNED.exists():
        UNSIGNED.unlink()
    count = 0
    with zipfile.ZipFile(SRC) as zin, zipfile.ZipFile(UNSIGNED, "w", allowZip64=True) as zout:
        for info in zin.infolist():
            if is_signature(info.filename):
                continue
            if info.filename in REPLACE:
                zout.writestr(info, REPLACE[info.filename])
            else:
                with zin.open(info) as src, zout.open(info, "w") as dst:
                    shutil.copyfileobj(src, dst, 1024 * 1024)
            count += 1
    print(f"wrote {UNSIGNED} ({UNSIGNED.stat().st_size} bytes, {count} entries)")

    if SIGNED.exists():
        SIGNED.unlink()
    subprocess.run([
        str(JDK_BIN / "jarsigner.exe"), "-keystore", str(KEYSTORE),
        "-storepass", "android", "-keypass", "android",
        "-sigalg", "SHA256withRSA", "-digestalg", "SHA-256",
        "-signedjar", str(SIGNED), str(UNSIGNED), "androiddebugkey",
    ], check=True)
    subprocess.run([str(JDK_BIN / "jarsigner.exe"), "-verify", "-certs", str(SIGNED)], check=True)
    print(f"signed {SIGNED} ({SIGNED.stat().st_size} bytes)")


if __name__ == "__main__":
    main()
