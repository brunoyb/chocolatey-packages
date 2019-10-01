$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.2102/gvim_8.1.2102_x86.zip'
$checksum32 = '61c222610cba4a7dc4b0db13c02d9ef1674102aedcb81a5c6f84764815781e29'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.2102/gvim_8.1.2102_x64.zip'
$checksum64 = '7e5a2ae723fd29c1c103d480230493c980dc444b34c168546e36db8cae6b39e7'
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
