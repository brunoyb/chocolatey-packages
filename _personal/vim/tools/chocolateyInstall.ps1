$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$url32 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.0.1509/gvim_8.0.1509_x86.zip'
$checksum32 = '85c34014d92d10d4f14c15efd697fd2619c2aa04c3e605d95ebcebda5dddd41c'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/vim/vim-win32-installer/releases/download/v8.0.1509/gvim_8.0.1509_x64.zip'
$checksum64 = '6ffb1b681b657569748d452270206b97e895d527584b2fee4145759ac8a2717f'
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
