$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.0541/gvim_8.1.0541_x86.zip'
$checksum32 = '8e0b65183ec89d7cf29588a561a698cb5564d0bf63b5283aca84216c4f2679bf'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.0541/gvim_8.1.0541_x64.zip'
$checksum64 = '20615936e899d75bbf627e4e0f82d0b959ca0bda1c5c5ef762458694b03a348b'
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
