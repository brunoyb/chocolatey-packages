$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.1240/gvim_8.1.1240_x86.zip'
$checksum32 = 'c0d57bda4624543b0c2d190b70e089ded7f20d1e5327972875383253b9f15c12'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.1240/gvim_8.1.1240_x64.zip'
$checksum64 = 'd3fea30e71f8e669fce46edec0c812555d05b54fd10b8da90e7b54a59830db19'
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
