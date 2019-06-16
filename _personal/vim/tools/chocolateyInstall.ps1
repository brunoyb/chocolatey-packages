$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.1551/gvim_8.1.1551_x86.zip'
$checksum32 = '0e507125e1a023d694b99e58add80283018b03bb97efcbb212650964744ed06e'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.1551/gvim_8.1.1551_x64.zip'
$checksum64 = 'c045e90cba1919ed67ac306124ba9f760815c6b2d54192d829b0908bf17457ef'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$installDir = Get-ToolsLocation

. $toolsDir\helpers.ps1

# Uninstall first.
. $toolsDir\chocolateyUninstall.ps1

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -Checksum $checksum32 `
                             -ChecksumType $checksumType32 `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $installDir

$vimExeDir = Get-VimExeDir $installDir

if ($vimExeDir) {
	Start-ChocolateyProcessAsAdmin -Statements '-add-start-menu -install-openwith -install-popup' `
	                               -ExeToRun "$(Join-Path $vimExeDir 'install.exe')"

	Install-ChocolateyPath $vimExeDir 'Machine'
}
