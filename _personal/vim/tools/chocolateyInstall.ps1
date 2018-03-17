$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.0.1612/gvim_8.0.1612_x86.zip'
$checksum32 = '564a94a40fb37526ed405da630085efea84e8f0dbf1ceb62472d5d0c0e17d043'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.0.1612/gvim_8.0.1612_x64.zip'
$checksum64 = '69630388b52efbc0cf55cecd3548c2ec6d96b2b8a247ea6ee8042d5fc5f67ece'
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
