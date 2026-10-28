param(
    [int]$IntervalMinutes = 5
)
$script = Join-Path $PSScriptRoot "save_progress.ps1"
Write-Host "自动保存已启动：每 $IntervalMinutes 分钟执行一次。关闭窗口即停止。"
while ($true) {
    & $script
    Start-Sleep -Seconds ($IntervalMinutes * 60)
}
