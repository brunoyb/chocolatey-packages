$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.0.1806/gvim_8.0.1806_x86.zip'
$checksum32 = 'e5d1883f35634463e4773f03596389f3575179993828f79f7084ff950995fe62'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.0.1806/gvim_8.0.1806_x64.zip'
$checksum64 = '04eb1d9c234f2b8a6cb6ae9327edb9cba8d3271c75534004aa3cc4dbb21de359'
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
