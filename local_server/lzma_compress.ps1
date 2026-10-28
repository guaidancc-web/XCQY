param(
    [Parameter(Mandatory = $true)][string]$InDir,
    [Parameter(Mandatory = $true)][string]$OutDir,
    [string]$LzmaDll = 'D:\moyu\nixiangxiao\extracted\assets\bin\Data\Managed\lzmadll.dll'
)

$ErrorActionPreference = 'Stop'
Add-Type -Path $LzmaDll
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
$count = 0
Get-ChildItem -Path $InDir -Recurse -File | ForEach-Object {
    $rel = $_.FullName.Substring($InDir.Length).TrimStart('\', '/')
    $outPath = Join-Path $OutDir $rel
    New-Item -ItemType Directory -Force -Path (Split-Path $outPath -Parent) | Out-Null
    $data = [IO.File]::ReadAllBytes($_.FullName)
    $in = New-Object System.IO.MemoryStream -ArgumentList @(,$data)
    $out = New-Object System.IO.MemoryStream
    $props = New-Object System.IO.MemoryStream
    $enc = New-Object SevenZip.Compression.LZMA.Encoder
    $enc.WriteCoderProperties($props)
    $enc.Code($in, $out, $in.Length, -1, $null)
    $header = $props.ToArray() + [BitConverter]::GetBytes([long]$in.Length)
    [IO.File]::WriteAllBytes($outPath, [byte[]]($header + $out.ToArray()))
    $count++
}
Write-Output ("compressed " + $count + " files to " + $OutDir)
