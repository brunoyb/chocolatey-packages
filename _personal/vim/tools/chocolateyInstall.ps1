$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.0.1475/gvim_8.0.1475_x86.zip'
$checksum32 = '76be3b9e21ed1388b2250ab396d917b9cdfc992493adf65141b289dbf45257e5'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.0.1475/gvim_8.0.1475_x64.zip'
$checksum64 = 'bea617ab5399edcaa3c6db7a3a530368683ada3ad9b2ddcaccec42df13f5e2cd'
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
