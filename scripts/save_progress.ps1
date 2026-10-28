param(
    [switch]$NoPush,
    [string]$Message = ""
)
$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $PSScriptRoot
$Erl = Join-Path $Root "tmp\erlang19\bin\erl.exe"
$Erlc = Join-Path $Root "tmp\erlang19\bin\erlc.exe"
$Mysqldump = Join-Path $Root "tmp\mariadb\mariadb-10.6.28-winx64\bin\mysqldump.exe"
$SaveErl = Join-Path $PSScriptRoot "save_roles.erl"
$SaveOut = Join-Path $Root "tmp\build\save_out"
$DbFile = Join-Path $Root "db\fswy_current.sql"

Write-Host "[1/4] 强制保存在线角色 ..."
try {
    New-Item -ItemType Directory -Force -Path $SaveOut | Out-Null
    & $Erlc -o $SaveOut $SaveErl | Out-Null
    if ($LASTEXITCODE -ne 0) { throw "save_roles.erl 编译失败" }
    & $Erl "+S1:1" "-noshell" "-sname" ("saveprogress_" + $PID) `
        "-setcookie" "6bc1t325xjo21c1" "-pa" $SaveOut `
        "-eval" "save_roles:save_all(), init:stop()."
    if ($LASTEXITCODE -ne 0) { Write-Host "  角色落库失败（服务端可能未启动），继续导出数据库" }
} catch {
    Write-Host "  角色落库异常：$($_.Exception.Message)，继续导出数据库"
}

Write-Host "[2/4] 导出数据库 ..."
if (-not (Test-Path $Mysqldump)) { throw "缺少 mysqldump：$Mysqldump" }
if (Test-Path $DbFile) { Remove-Item $DbFile -Force }
& $Mysqldump "-uroot" "-p123456" "-h127.0.0.1" "--add-drop-database" `
    "--databases" "fswy_dev_1" "fswy_dev_2" "fswy_dev_9000" "fswy_dev_9999" `
    "--routines" "--events" "--single-transaction" ("--result-file=" + $DbFile)
if ($LASTEXITCODE -ne 0 -or -not (Test-Path $DbFile)) { throw "mysqldump 导出失败" }
Write-Host ("  已导出 " + $DbFile + " (" + (Get-Item $DbFile).Length + " bytes)")

Write-Host "[3/4] 提交 git ..."
Push-Location $Root
try {
    $status = git status --porcelain
    if (-not $status) {
        Write-Host "  没有需要保存的改动"
    } else {
        if (-not $Message) { $Message = "保存游戏存档与进度 " + (Get-Date -Format "yyyy-MM-dd HH:mm:ss") }
        git add -A
        git commit -m $Message
        if ($LASTEXITCODE -ne 0) { throw "git commit 失败" }
        Write-Host ("  已提交 " + (git rev-parse --short HEAD))
    }

    Write-Host "[4/4] 推送 GitHub ..."
    if ($NoPush) {
        Write-Host "  -NoPush：跳过推送"
    } else {
        git push origin main
        if ($LASTEXITCODE -ne 0) {
            Write-Host "  push 失败（网络/GitHub 连接问题），提交已保存在本地，稍后重试"
        } else {
            Write-Host "  推送完成"
        }
    }
} finally {
    Pop-Location
}
