$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.0757/gvim_8.1.0757_x86.zip'
$checksum32 = '052814f5179f7f419d45c93db1e1555b14b15b17f2f0a6cc4a534bc317b3314a'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.0757/gvim_8.1.0757_x64.zip'
$checksum64 = '1d35c0c44409f046a261a474c356a6f84d1129e897c38a3a9a6d2074c23cd6ff'
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
