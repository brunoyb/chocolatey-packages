$ErrorActionPreference = 'Stop'

$packageName = 'pt'
$url32 = 'https://github.com/monochromegane/the_platinum_searcher/releases/download/v2.2.0/pt_windows_386.zip'
$checksum32 = 'd32ebffe0c2cf142351b6037e73e0bde18044f9c77960c7b55076e45dc80929d'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/monochromegane/the_platinum_searcher/releases/download/v2.2.0/pt_windows_amd64.zip'
$checksum64 = '7fa5aab0462a63cc1a746af3f07f1d03bf6521e23f8b2d149fc5af7b4e00596c'
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
