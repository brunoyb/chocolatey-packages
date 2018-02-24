$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.0.1532/gvim_8.0.1532_x86.zip'
$checksum32 = '01ceebc4c3bc9f5c4b2976d4bfa17c145c9ad81977705a350b102076a52064d0'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.0.1532/gvim_8.0.1532_x64.zip'
$checksum64 = '7c69b62352eaaf10992ab2a1dcdd2ade2681f22496a06848a61795435ed21421'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -Checksum $checksum32 `
                             -ChecksumType $checksumType32 `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

Start-ChocolateyProcessAsAdmin -Statements '-add-start-menu -install-openwith -install-popup' `
                               -ExeToRun "$(Join-Path $toolsDir 'vim\vim80\install.exe')"

Install-ChocolateyPath "$(Join-Path $toolsDir 'vim\vim80')" 'Machine'
