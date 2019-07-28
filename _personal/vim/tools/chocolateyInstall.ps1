$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.1764/gvim_8.1.1764_x86.zip'
$checksum32 = '16926b3a557e32015aaa5f08135ca8168a564bd1019dc6ebf87edc5b13ce0dcb'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.1764/gvim_8.1.1764_x64.zip'
$checksum64 = 'cd1507c6c0f0558ba99d2772f57f06053df02c052ade9169d0b21a71134be32d'
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
