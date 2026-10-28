param([switch]$Reinstall, [switch]$BundleOnly)
$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $PSScriptRoot
$adb = Join-Path $Root "tools\platform-tools\adb.exe"
$apk = Join-Path $Root "base_icon.apk"
$bundle = Join-Path $Root "dist\textures_business.unity3d"
$dataBundle = Join-Path $Root "dist\textures_business_data.unity3d"
$zip = Join-Path $Root "client_data\com.xcqy.ceshi_files.zip"
$dev = "127.0.0.1:58526"
$pkg = "com.xcqy.ceshi"

if (-not (Test-Path $adb)) { throw "缺少 adb：$adb（见迁移文档第 1 节）" }

& $adb connect $dev | Out-Null
$state = (& $adb devices) -join "`n"
if ($state -notmatch ([regex]::Escape($dev) + "\s+device")) {
    throw "WSA 未连接。先启动 Windows Subsystem for Android，并在设置里开启开发人员模式(ADB)。"
}

if (-not $BundleOnly) {
    $installed = & $adb -s $dev shell pm path $pkg 2>$null
    if ($Reinstall -or -not ($installed -match "package:")) {
        if (-not (Test-Path $apk)) { throw "缺少 APK：$apk" }
        Write-Host "安装 APK（约 441MB，请稍等）..."
        & $adb -s $dev install -r -d $apk
    }
}

Write-Host "推送客户端 bundle ..."
$files = @()
if (Test-Path $bundle) { $files += @{ Src = $bundle; Name = "textures_business.unity3d" } }
if (Test-Path $dataBundle) { $files += @{ Src = $dataBundle; Name = "textures_business_data.unity3d" } }
foreach ($f in $files) {
    $staging = "/sdcard/Android/data/$pkg/files/xcqy_$($f.Name)"
    & $adb -s $dev push $f.Src $staging | Out-Null
    foreach ($d in @("/sdcard/Android/data/$pkg/files/res/textures", "/sdcard/Android/data/$pkg/files/res_theone/textures")) {
        & $adb -s $dev shell mkdir -p $d | Out-Null
        & $adb -s $dev shell "rm -f $d/$($f.Name); cp $staging $d/$($f.Name) && chmod 777 $d/$($f.Name)" | Out-Null
    }
    & $adb -s $dev shell rm -f $staging | Out-Null
}

if (-not $BundleOnly -and (Test-Path $zip)) {
    Write-Host "恢复客户端资源包 ..."
    $tmp = Join-Path $env:TEMP ("xcqy_files_" + [guid]::NewGuid().ToString("N"))
    Expand-Archive -Path $zip -DestinationPath $tmp -Force
    $files = Join-Path $tmp "files"
    & $adb -s $dev shell mkdir -p "/sdcard/Android/data/$pkg/files" | Out-Null
    foreach ($item in Get-ChildItem $files) {
        & $adb -s $dev push $item.FullName "/sdcard/Android/data/$pkg/files/" | Out-Null
    }
    Remove-Item $tmp -Recurse -Force
}

Write-Host "建立 adb reverse ..."
foreach ($port in 8081, 8001) {
    & $adb -s $dev reverse --remove "tcp:$port" 2>$null | Out-Null
    & $adb -s $dev reverse "tcp:$port" "tcp:$port" | Out-Null
}

if (-not $BundleOnly) {
    Write-Host "启动游戏 ..."
    $wsa = Join-Path $env:LOCALAPPDATA "Microsoft\WindowsApps\MicrosoftCorporationII.WindowsSubsystemForAndroid_8wekyb3d8bbwe\WsaClient.exe"
    if (Test-Path $wsa) {
        Start-Process -FilePath $wsa -ArgumentList "/launch", "wsa://$pkg"
    } else {
        & $adb -s $dev shell am start -n "$pkg/cn.kkk.commonsdk.WelcomeAcitivity" | Out-Null
    }
    Write-Host "完成。首次启动会自动填 test123 并登录。"
} else {
    Write-Host "bundle 已推送。重启游戏后生效。"
}
