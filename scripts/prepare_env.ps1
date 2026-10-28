$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $PSScriptRoot
$rootFwd = $Root.Replace('\', '/')
$hostName = $env:COMPUTERNAME

$cfgDir = Join-Path $Root "YCserver\run"
$cfgs = @(Get-ChildItem $cfgDir -Recurse -Filter env.cfg -ErrorAction SilentlyContinue)
$changed = 0
foreach ($f in $cfgs) {
    $text = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $orig = $text
    $text = $text.Replace("D:/moyu/nixiangxiao", $rootFwd)
    $text = $text -replace '@cll\b', ('@' + $hostName)
    $text = $text -replace '(\{host,\s*")cll(")', ('${1}' + $hostName + '${2}')
    if ($text -ne $orig) {
        [System.IO.File]::WriteAllText($f.FullName, $text, (New-Object System.Text.UTF8Encoding($false)))
        $changed++
    }
}
Write-Host "env.cfg 已更新 $changed 个（host=$hostName，路径=$rootFwd）"

$checks = @(
    @{ Path = "tmp\erlang19\bin\erl.exe";                         Name = "Erlang OTP 19.3 运行时" },
    @{ Path = "tmp\mariadb\mariadb-10.6.28-winx64\bin\mysqld.exe"; Name = "MariaDB 10.6 运行时" },
    @{ Path = "tools\platform-tools\adb.exe";                     Name = "adb (platform-tools)" },
    @{ Path = "tools\jdk-21.0.12.1+1\bin\jarsigner.exe";          Name = "JDK 21（重新签 APK 时需要）" },
    @{ Path = "base_icon.apk";                                    Name = "游戏 APK" }
)
$missing = 0
foreach ($c in $checks) {
    $p = Join-Path $Root $c.Path
    if (Test-Path $p) {
        Write-Host "[OK]   $($c.Name)"
    } else {
        Write-Warning "缺少 $($c.Name)：$($c.Path)"
        $missing++
    }
}
if ($missing -gt 0) {
    Write-Host "按 docs\迁移到另一台电脑.md 第 1 节把大文件拷到对应位置。"
}
