$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.2080/gvim_8.1.2080_x86.zip'
$checksum32 = 'ede07ba6110023b0cfc6dcc08f42ee5c4582cf617f8d933ab02ef57dd12abc50'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.2080/gvim_8.1.2080_x64.zip'
$checksum64 = '646041ddf8d9f33d98dc9d2ee92b2789d158bf808a9d0c48780db4b4cba160b9'
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
