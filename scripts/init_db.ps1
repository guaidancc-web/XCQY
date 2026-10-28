param([switch]$Force)
$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $PSScriptRoot
$bin = Join-Path $Root "tmp\mariadb\mariadb-10.6.28-winx64\bin"
$data = Join-Path $Root "YCserver\run\mysql-data"
$dump = Join-Path $Root "db\fswy_current.sql"
$mysqld = Join-Path $bin "mysqld.exe"
$mysql = Join-Path $bin "mysql.exe"

if (-not (Test-Path $mysqld)) { throw "缺少 MariaDB：$mysqld（见迁移文档第 1 节）" }
if (-not (Test-Path $dump)) { throw "缺少数据库导出：$dump" }

if (-not (Test-Path (Join-Path $data "mysql"))) {
    Write-Host "初始化 MariaDB 数据目录 ..."
    New-Item -ItemType Directory -Force $data | Out-Null
    & (Join-Path $bin "mysql_install_db.exe") "--datadir=$data" "--password=123456"
    if ($LASTEXITCODE -ne 0) { throw "mysql_install_db 失败，退出码 $LASTEXITCODE" }
}

function Test-Port3306 {
    return [bool](netstat -ano | Select-String ":3306\s.*LISTENING")
}

if (-not (Test-Port3306)) {
    Write-Host "启动 mysqld ..."
    Start-Process -FilePath $mysqld -ArgumentList "--datadir=$data", "--port=3306", "--bind-address=127.0.0.1" -WindowStyle Minimized
    for ($i = 0; $i -lt 30; $i++) {
        Start-Sleep -Seconds 1
        if (Test-Port3306) { break }
    }
}
if (-not (Test-Port3306)) { throw "mysqld 启动失败，3306 未监听" }

$exists = & $mysql -uroot -p123456 -h127.0.0.1 -N -e "SHOW DATABASES LIKE 'fswy_dev_1'" 2>$null
if ($exists -and -not $Force) {
    Write-Host "数据库已存在，跳过导入（需要覆盖请加 -Force）。"
    exit 0
}

Write-Host "导入 $dump ..."
$p = Start-Process -FilePath $mysql -ArgumentList "-uroot", "-p123456", "-h127.0.0.1" -RedirectStandardInput $dump -NoNewWindow -Wait -PassThru
if ($p.ExitCode -ne 0) { throw "数据库导入失败，退出码 $($p.ExitCode)" }
Write-Host "数据库导入完成。"
