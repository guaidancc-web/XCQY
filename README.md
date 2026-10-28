# 遮天 / 星辰奇缘 本地服（WSA）

让 Android 游戏 `com.xcqy.ceshi`（遮天 / 星辰奇缘）在 Windows 11 的 WSA 里连接本机私服运行，并支持继续修改客户端 Lua、服务端 Erlang 代码和数据库。

## 架构

```
Windows 11
├─ WSA（Android 13）── 游戏 APK（base_icon.apk，重签+卡通图标）
│    └─ files/res_theone/textures/textures_business.unity3d   2025 版客户端 Lua（含本地服补丁）
│
├─ local_server/server.py      HTTP :8081（base_setting / list / 登录 / 遥测兼容 / 官方 CDN 镜像）
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
| `dist/textures_business.unity3d` | 2025 版客户端 Lua bundle，已打本地服补丁（登录/列表指向 127.0.0.1、图鉴新宠物置顶等） |
| `dist/textures_business_data.unity3d` | 2025 版数据 bundle，已把 20022–20039、20041–20069 的 `show_manual` 改为 1（图鉴可见） |
| `client_data/` | 2021 版客户端资源目录打包（6.3MB，作为全新安装的基底，之后靠在线更新升到 2025） |
| `db/fswy_current.sql` | 当前 4 个数据库导出（含角色进度） |
| `scripts/` | 新电脑部署脚本 |
| `docs/` | 迁移与修改说明 |

## 2025 官方资源更新（约 147MB）

原版客户端会从官方 CDN `http://106.52.8.88:81/xcqy_dev` 拉一份 2025 年资源包（`res_version=202506251639`，相对 APK 的 2021 资源是 1,865 个文件、约 147MB）。现在 `local_server/server.py` 兼任镜像和回源代理：

- 客户端请求 `/xcqy_dev/...` 时，先找本地 `cdn/` 缓存，找不到再回源下载并写入 `cdn/`。
- 默认 `RES_VERSION=202506251639`、`UPSTREAM_CDN=http://106.52.8.88:81/xcqy_dev`，可用同名环境变量覆盖；`UPSTREAM_CDN=`（置空）可禁外网。
- `cdn/` 约 158MB，不进 git。想离线部署就把整个目录拷到新电脑；不拷也能联网自动重建。

更新流程（新电脑第一次跑必做）：

1. 启动服务，进游戏，等客户端自动下载并应用 2025 资源（约 147MB，结束时会到 2025 版登录界面）。
2. 官方更新会把 `textures_business.unity3d` 覆盖成原版，因此要再推一次本地补丁：
   `powershell -ExecutionPolicy Bypass -File scripts\deploy_client.ps1 -BundleOnly`
3. 重启游戏。`-BundleOnly` 只推 bundle，不动 `res`/`res_theone` 的其它资源，可在游戏运行时执行。

2025 客户端在本地 `base_setting.json` 的 `check_apk` 为 `true` 时会请求 `GET <check_apk_path>/check_apk_version.php`；本服默认返回 `check_apk=false` 且该接口返回完整 JSON，避免卡在「检查游戏版本」。

## 新宠物（2022–2025）

2025 客户端 `data_pet` 比 2021 多 26 只（20041–20069，缺 20054/20056/20059），并且把之前补过的 20022–20039 的 `show_manual` 改成了 0。现在已完整接入：

- 客户端：`local_server/patch_data_2025.py` 把 20022–20039、20041–20069 的 `show_manual` 改回 1；`patch_bundle_2025.py` 的图鉴置顶范围扩到 20069。
- 服务端：`local_server/patch_pets_2025.py` 为 26 只宠物补 `get_base`/`model`/`get_polish`/`allow_stone`，并补齐它们引用的 119 个技能（43 主动 + 76 被动）。技能优先从同族 60xxx 继承数值，找不到模板的用 60089/60019（主动）或 60830（被动）。
- 产物：`dist/textures_business.unity3d` + `dist/textures_business_data.unity3d`；`deploy_client.ps1`（含 `-BundleOnly`）会一起推送。
- 效果：特殊宠物图鉴 95 只可见，20022–20069 排最前；4 个 Erlang 节点已热加载，`pet_data:get_base(20041)` 等 RPC 可查。

重新生成：

```bash
python local_server/patch_data_2025.py     # 客户端 data bundle
python local_server/patch_bundle_2025.py   # 客户端 business bundle
python local_server/patch_pets_2025.py --install  # 服务端 + 差分验证 + 热加载
```

`patch_pets_2025.py` 的基线优先用 `tmp/build/src`（含 20022–20039 的已补状态），没有则用 `YCserver/erl_src`；脚本幂等，已存在的宠物/技能会跳过。

### 技能还原进度（2026-10-28）

| 部分 | 状态 |
|---|---|
| 119 个技能的属性（百分比×10、等级公式 type3/8） | **已精确还原**（`refine_skill_attrs.py`） |
| 20 个主动攻击技能的目标数/MP/冷却/类型 | **已精确还原**；12 个多段技能改为 2/3/5 段，目标数取各段平均；伤害倍率按档位推断（`refine_active_shell.py`） |
| 32 个触发脚本（复活/神佑/逃生/护主/反弹/还击/连击/吸血/禁魂/审判/驱鬼/物穿/法穿等） | **已映射**，描述里写明的概率/比例已传入（`refine_skill_triggers.py`） |
| 治疗/回蓝/群盾/减伤/增伤/反伤/隐身/复活/免疫（25 个） | **已接入**现有 buff/脚本（`refine_unique_mechanics.py`）；复活用 90335 近似（未做蛋形），67116 保持仅属性 |
| 伤害分担/叠层/特殊公式/特殊条件（当前生命%、溅射、随机形态、击杀转火、附加吸血/治疗、怒气、沉默等） | **待写新脚本**；目前不会错误攻击，但也尚未生效 |
| 未写明的伤害倍率/命中系数 | 只能按同档技能推断，客户端没有这些数据 |

第三阶段脚本：`refine_skill_triggers.py`（触发）与 `refine_unique_mechanics.py`（治疗/护盾等），可重复执行；旧调用点差分验证必须保持 0 回归。

## 继续修改

### 客户端 Lua（2025）
1. 准备官方 2025 bundle：进游戏更新一次后会自动缓存在 `cdn/patch_android/202505180009/textures/textures_business.unity3d`，也可放到 `tmp/updated_client/business_2025.unity3d`。
2. 在 `local_server/patch_bundle_2025.py` 里给目标 TextAsset 增加补丁函数并注册到 `PATCHERS`。
3. 运行 `python local_server/patch_bundle_2025.py`，产物在 `tmp/bundle_2025_patched/textures_business.unity3d`；复制到 `dist/`。
4. 改数据表（如 `data_pet`）用 `python local_server/patch_data_2025.py`，产物同时写入 `dist/textures_business_data.unity3d`。
5. `deploy_client.ps1 -BundleOnly` 会把两个 bundle 一起推到设备的 `res`/`res_theone`，重启游戏生效。

2021 版（APK 内置）bundle 的旧流程仍保留在 `local_server/patch_bundle.py`，仅作参考。

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

- **GitHub 仓库目前实际是公开状态**（2026-10-28 检查），里面有游戏资源和本地测试签名 `local_server/debug.keystore`，请尽快在仓库 Settings → Danger Zone 改成 Private。
- APK、运行时（Erlang/MariaDB/JDK/adb）、WSA 安装包、`cdn/` 资源镜像不进 git，需单独拷贝。
- APK、`tmp/`、`tools/`、`wsa/`、`extracted/`、`XYserver/` 等见 `.gitignore`。
