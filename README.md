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

### 技能还原进度（2026-10-29）

| 部分 | 状态 |
|---|---|
| 119 个技能的属性（百分比×10、等级公式 type3/8） | **已精确还原**（`refine_skill_attrs.py`） |
| 20 个主动攻击技能的目标数/MP/冷却/类型 | **已精确还原**；多段技能的每段目标数改为按客户端 `data_combat_skill` 逐段还原（3/3/3、3/4/5、5×1 等），`target_list` 已按段数补全；伤害倍率仍按档位推断（`refine_active_shell.py` + `refine_batch13.py`） |
| 32 个触发脚本（复活/神佑/逃生/护主/反弹/还击/连击/吸血/禁魂/审判/驱鬼/物穿/法穿等） | **已映射**，描述里写明的概率/比例已传入（`refine_skill_triggers.py`） |
| 独立脚本 700001-700033（67110 真实伤害、67116 物理受击盾、60284/67080 扣蓝、67127 出场+受击魔法盾、67305 减伤/反伤/沉默、67359 吸血+受击减伤、67365 击杀回血+燃火、60279 召唤回主人血、67306 死亡回全队血、67340 随机双/三倍、60281 召唤清心、67310 速度条件增伤/减伤、60280 召唤减主人冷却、67111 暗域、67331 死亡冲锋、67335 死亡追击、67345 天佑、67361 搬山、67333/67342 怒气、67368 附加治疗、67300 伤害分担、67200 随机阴阳形态、60450 攻击伤害分担、67068 回合末清异常、67077 击杀回血、67083/67207 攻击清增益、67097/67133 首次受击增伤、67367 阵亡增伤、67353/67363 随机5–8段、67378 风雷祝福/百分比速度、67347 阈值减伤） | **已接入**（`combat_script_skill.erl` 新脚本分支，老技能不动；独立脚本统一用 `convert_buff` 构造 buff 记录） |
| 叠层（67082/67132/67300/67344/67360）、67131 当前生命25%、67341 10%免疫、67085/67330/67334 吸血、67075 封心+护盾 | **已接入**（`refine_stacking.py` / `refine_active_shell.py` / `refine_unique_mechanics.py`）；叠层用通用增伤 90500/90501 近似 |
| 治疗/回蓝/群盾/减伤/增伤/反伤/隐身/复活/免疫（25 个） | **已接入**现有 buff/脚本（`refine_unique_mechanics.py`）；复活用 90335 近似（未做蛋形），67116 保持仅属性 |
| 伤害分担（60450/67345/67300）、怒气（67333/67342）、击杀追击（67335）、附加治疗/护盾（67368）、随机形态（67200 阳焱全体/阴焱2×2）、随机 5–8 段（67353/67363，67363 每段 20% 眩晕）、67316/67327 受击护盾 | **已接入**新脚本/新 buff（700016/700017/700019-700030、90503-90510）；伤害分担用 `protector` 机制把 30%–40% 伤害转给随机敌人 |
| 67378 风雷护盾触发几率、67347 的 DoT/固定伤害路径 | **已接入/仍有边界**；67378 的 15% 物攻/速度/生命已精确生效（速度用 `combat_cache` 新增 speed 属性，按基础速度 15% 计算），护盾 70% 几率 250% 生命 2 回合（数值参考 60517）；67347 已覆盖普通/反击/协助攻击，DoT 直接扣血路径未接 |
| 未写明的伤害倍率/命中系数 | 只能按同档技能推断，客户端没有这些数据 |

每个技能当前生效效果见 [docs/技能效果表.md](docs/技能效果表.md)。

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

## 保存存档与进度

游戏存档就是 MariaDB 里的角色数据（等级、背包、宠物、技能等），仓库里的 `db/fswy_current.sql` 是它的完整导出。

一键保存（推荐每次玩完/改完后运行）：

```powershell
powershell -ExecutionPolicy Bypass -File scripts\save_progress.ps1
```

它依次做四件事：

1. 通过 Erlang RPC 强制把在线角色写回数据库（含刚获得的宠物/物品）；
2. 用 `mysqldump` 导出 `fswy_dev_1/2/9000/9999` 到 `db/fswy_current.sql`；
3. `git add -A` + 提交（时间戳消息）；
4. `git push origin main`。

离线时加 `-NoPush` 只提交不推送；网络恢复后再 `git push`。想定时自动保存可以单独开一个窗口运行：

```powershell
powershell -ExecutionPolicy Bypass -File scripts\auto_save.ps1 -IntervalMinutes 5
```

窗口保持打开即可，关闭窗口停止。注意：定时保存会按间隔产生提交（角色心跳/时间戳也会变），按需使用。

换电脑后：`git pull` → `powershell -ExecutionPolicy Bypass -File scripts\init_db.ps1 -Force` 导入最新存档，再按启动流程开服。

### 充值（本地直充）

客户端 `SdkManager:ShowChargeView` 已被 `patch_bundle_2025.py` 改为发送 GM 9900 `充值 <钻石> 0`，不再调用已失效的 SDK 支付。服务端 `gm_cmd` 的“充值”命令会写 `charge` 订单并走原生 `charge:notice/charge:pay` 发货（含档位赠送）。

入口：**商城 → 充值**，点档位即可；福利页的“充值好礼”是抽奖，不是充值档位。服务端命令已用 RPC 实测能生成 charge 订单。

## 迁移到另一台电脑

见 [docs/迁移到另一台电脑.md](docs/迁移到另一台电脑.md)。

## 注意

- **GitHub 仓库目前实际是公开状态**（2026-10-28 检查），里面有游戏资源和本地测试签名 `local_server/debug.keystore`，请尽快在仓库 Settings → Danger Zone 改成 Private。
- APK、运行时（Erlang/MariaDB/JDK/adb）、WSA 安装包、`cdn/` 资源镜像不进 git，需单独拷贝。
- APK、`tmp/`、`tools/`、`wsa/`、`extracted/`、`XYserver/` 等见 `.gitignore`。
