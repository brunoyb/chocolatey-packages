$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.0127/gvim_8.1.0127_x86.zip'
$checksum32 = '7ff7533d3981e7acb7f296ea4bc92ba7e927cb0eabe68398bd22dec035032575'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.0127/gvim_8.1.0127_x64.zip'
$checksum64 = '7fd866ad4091f8185e7893f06733233c7a268a9b1aab2ff70c92ab51b054a3fa'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$installDir = Get-ToolsLocation

. $toolsDir\helpers.ps1
. $toolsDir\Uninstall-ChocolateyPath.ps1

$vimExeDir = Get-VimExeDir $installDir

if ($vimExeDir) {
	Start-ChocolateyProcessAsAdmin -Statements '-nsis' `
	                               -ExeToRun "$(Join-Path $vimExeDir 'uninstal.exe')"

	Stop-Process -ProcessName explorer
	Sleep 5

	Remove-Item -Recurse -Force "$(Join-Path $installDir 'vim')"

	Uninstall-ChocolateyPath $vimExeDir 'Machine'
}

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -Checksum $checksum32 `
                             -ChecksumType $checksumType32 `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $installDir

$vimExeDir = Get-VimExeDir $installDir

Start-ChocolateyProcessAsAdmin -Statements '-add-start-menu -install-openwith -install-popup' `
                               -ExeToRun "$(Join-Path $vimExeDir 'install.exe')"

Install-ChocolateyPath $vimExeDir 'Machine'
