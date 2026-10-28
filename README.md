# 遮天 / 星辰奇缘 本地服（WSA）

让 Android 游戏 `com.xcqy.ceshi`（遮天 / 星辰奇缘）在 Windows 11 的 WSA 里连接本机私服运行，并支持继续修改客户端 Lua、服务端 Erlang 代码和数据库。

## 架构

```
Windows 11
├─ WSA（Android 13）── 游戏 APK（base_icon.apk，重签+卡通图标）
│    └─ files/res*/textures/textures_business.unity3d   覆盖版客户端 Lua
│
├─ local_server/server.py      HTTP :8081（base_setting / list / 登录 / 遥测兼容）
├─ YCserver（Erlang OTP 19.3） TCP :8001（zone1/zone2/center9000/center9999）
└─ MariaDB 10.6                :3306（4 个 fswy_dev_* 库）
```

WSA 里的 `127.0.0.1:8081 / :8001` 通过 `adb reverse` 转到 Windows 本机。

## 需要另外准备的文件（不在仓库里）

除了 clone 本仓库，还要按下面路径准备这些文件/运行时（详细步骤见 [迁移文档](docs/迁移到另一台电脑.md) 第 1 节）：

| 路径 | 大小 | 什么时候需要 |
|---|---|---|
| `base_icon.apk` | 441 MB | **必需**：已打补丁、重签、换过图标的游戏安装包 |
| `tmp/erlang19/` | 338 MB | **必需**：Erlang OTP 19.3 运行时 |
| `tmp/mariadb/mariadb-10.6.28-winx64/` | 256 MB | **必需**：MariaDB 10.6 运行时 |
| `tools/platform-tools/` | 17 MB | **必需**：adb |
| `wsa/WSA_2407.40000.4.0_x64/` | 1.9 GB | 新电脑还没装 WSA 时需要（管理员运行其中的 `Install.ps1`） |
| `tools/jdk-21.0.12.1+1/` | 329 MB | 只有重新签 APK 时需要 |
| `tools/7zr.exe` | 1 MB | 只有重新打包 APK（`local_server/lzma_compress.ps1`）时需要 |

另外需要：Windows 11、Python 3（`pip install -r requirements.txt`）、Git Bash。

不用准备 `extracted/`：`python scripts/extract_assets.py` 会从 `base_icon.apk` 解出。

## 当前电脑启动

双击 `启动遮天.bat`。它会依次检查并启动 MariaDB、4 个 Erlang 节点、HTTP 服务、adb 端口转发，然后启动游戏；游戏已在运行时只切前台，不重启。

## 目录说明

| 路径 | 说明 |
|---|---|
| `local_server/` | Python HTTP 服务、协议模拟、bundle/APK/图标补丁脚本 |
| `YCserver/erl_src/` | 反编译的 Erlang 服务端源码（约 1278 个 .erl） |
| `YCserver/data/server/ebin/` | 编译好的服务端 beam |
| `YCserver/data/zone/` | 4 个节点的静态数据 |
| `YCserver/run/` | 启动脚本、节点 env.cfg（运行状态不入库） |
| `dist/textures_business.unity3d` | 已打补丁的客户端 Lua bundle（含图鉴新宠物置顶等修改） |
| `client_data/` | 当前客户端资源目录打包（7.6MB，含已推送的 bundle 和地图） |
| `db/fswy_current.sql` | 当前 4 个数据库导出（含角色进度） |
| `scripts/` | 新电脑部署脚本 |
| `docs/` | 迁移与修改说明 |

## 继续修改

### 客户端 Lua
1. 原始 bundle 从 APK 解出：`python scripts/extract_assets.py`（生成 `extracted/assets`）。
2. 在 `local_server/patch_bundle.py` 里给目标 TextAsset 增加补丁函数并注册到 `PATCHERS`。
3. 运行 `python local_server/patch_bundle.py`，产物在 `tmp/bundle_patched/`。
4. 推到设备 `files/res/textures/` 和 `files/res_theone/textures/`（`scripts/deploy_client.ps1` 会自动做），重启游戏生效。

依赖：`pip install -r requirements.txt`（UnityPy、Pillow）。

### 服务端
1. 改 `YCserver/erl_src/<mod>.erl`。
2. 用 `tmp/erlang19/bin/erlc.exe` 编译，覆盖 `YCserver/data/server/ebin/*.beam`。
3. 热加载：`rpc:call(Node, code, load_file, [Mod])`，无需重启。

### 数据库
改完可重新导出覆盖 `db/fswy_current.sql`：

```
tmp/mariadb/mariadb-10.6.28-winx64/bin/mysqldump.exe -uroot -p123456 -h127.0.0.1 \
  --add-drop-database --databases fswy_dev_1 fswy_dev_2 fswy_dev_9000 fswy_dev_9999 \
  --routines --events --single-transaction > db/fswy_current.sql
```

## 迁移到另一台电脑

见 [docs/迁移到另一台电脑.md](docs/迁移到另一台电脑.md)。

## 注意

- 仓库为私有：`local_server/debug.keystore` 是本地测试签名，不要公开或复用到正式包。
- APK、运行时（Erlang/MariaDB/JDK/adb）、WSA 安装包不进 git，需单独拷贝。
- APK、`tmp/`、`tools/`、`wsa/`、`extracted/`、`XYserver/` 等见 `.gitignore`。
