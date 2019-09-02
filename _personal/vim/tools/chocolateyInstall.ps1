$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.1963/gvim_8.1.1963_x86.zip'
$checksum32 = 'a5c2cdc1f4e7d9107c5f505c455e723bbd9f7d9880b82fecc864c2ed04b26966'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.1963/gvim_8.1.1963_x64.zip'
$checksum64 = '7f84c93497e162ec55cedc2367d91c98d209c2ec23c6d337a1e52319bff1ef33'
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
