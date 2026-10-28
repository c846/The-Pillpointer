param(
    [Parameter(Mandatory=$false)]
    [string]$SourceDir = $PSScriptRoot
)

# ==========================================
# PowerShell Windows Cursor Installer
# ==========================================

$FolderName = "MyCustomCursors"  # Name of the subfolder created in Windows Cursors
$TargetDir  = "$env:windir\Cursors\$FolderName"

# 1. Ensure the target directory exists in C:\Windows\Cursors
if (!(Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
}

# 2. Copy all cursor files (.cur and .ani) from the source directory to the system directory
Write-Host "Copying cursor files..." -ForegroundColor Cyan
Copy-Item "$SourceDir\*.cur" -Destination $TargetDir -Force -ErrorAction SilentlyContinue
Copy-Item "$SourceDir\*.ani" -Destination $TargetDir -Force -ErrorAction SilentlyContinue

# 3. Update the Windows Registry to apply your specific cursors
$RegPath = "HKCU:\Control Panel\Cursors"

Write-Host "Configuring registry..." -ForegroundColor Cyan
Set-ItemProperty -Path $RegPath -Name "Arrow"       -Value "$TargetDir\normal.cur"
Set-ItemProperty -Path $RegPath -Name "Help"        -Value "$TargetDir\help.cur"
Set-ItemProperty -Path $RegPath -Name "AppStarting" -Value "$TargetDir\busy.ani"
Set-ItemProperty -Path $RegPath -Name "Wait"        -Value "$TargetDir\busy.ani"
Set-ItemProperty -Path $RegPath -Name "Crosshair"   -Value "$TargetDir\precision.cur"
Set-ItemProperty -Path $RegPath -Name "IBeam"       -Value "$TargetDir\text.ani"
Set-ItemProperty -Path $RegPath -Name "No"          -Value "$TargetDir\unavailable.cur"
Set-ItemProperty -Path $RegPath -Name "SizeNS"      -Value "$TargetDir\vertical.cur"
Set-ItemProperty -Path $RegPath -Name "SizeWE"      -Value "$TargetDir\horizontal.cur"
Set-ItemProperty -Path $RegPath -Name "SizeNWSE"    -Value "$TargetDir\nwse.cur"
Set-ItemProperty -Path $RegPath -Name "SizeNESW"    -Value "$TargetDir\nesw.cur"
Set-ItemProperty -Path $RegPath -Name "SizeAll"     -Value "$TargetDir\move.cur"
Set-ItemProperty -Path $RegPath -Name "Hand"        -Value "$TargetDir\link.ani"

Write-Host "Cursors successfully installed and applied!" -ForegroundColor Green