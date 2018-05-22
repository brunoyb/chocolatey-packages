$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.0016/gvim_8.1.0016_x86.zip'
$checksum32 = '496e61aab243cca43a17facf534b7b2065de624b5810cf9c78a0d73c6ffb7377'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.0016/gvim_8.1.0016_x64.zip'
$checksum64 = '5bf5d940900fc4c84bde3d924ab8daa42c7dbeb592e671f2ff75b8a0e4c24c0e'
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
                               -ExeToRun "$(Join-Path $toolsDir 'vim\vim81\install.exe')"

Install-ChocolateyPath "$(Join-Path $toolsDir 'vim\vim81')" 'Machine'
