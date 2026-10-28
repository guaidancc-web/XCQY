Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class W {
  [DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr h);
  [DllImport("user32.dll")] public static extern bool ShowWindow(IntPtr h, int c);
  [DllImport("user32.dll")] public static extern bool GetWindowRect(IntPtr h, out RECT r);
  [DllImport("user32.dll")] public static extern bool SetCursorPos(int x, int y);
  [DllImport("user32.dll")] public static extern void mouse_event(uint f, uint x, uint y, uint d, int e);
  public struct RECT { public int L, T, R, B; }
}
"@
$p = Get-Process WsaClient -ErrorAction SilentlyContinue | Where-Object { $_.MainWindowHandle -ne 0 } | Select-Object -First 1
if (-not $p) { Write-Output "WsaClient window not found"; exit 1 }
$h = $p.MainWindowHandle
[W]::ShowWindow($h, 9) | Out-Null
[W]::SetForegroundWindow($h) | Out-Null
$r = New-Object W+RECT
[W]::GetWindowRect($h, [ref]$r) | Out-Null
$x = [int](($r.L + $r.R) / 2)
$y = $r.T + 15
[W]::SetCursorPos($x, $y) | Out-Null
[W]::mouse_event(2, 0, 0, 0, 0)
[W]::mouse_event(4, 0, 0, 0, 0)
Write-Output "focused WsaClient window at $x,$y"
