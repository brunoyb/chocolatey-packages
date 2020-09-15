$ErrorActionPreference = 'Stop'

$packageName = 'robo3t.portable'
$url64 = 'https://github.com/Studio3T/robomongo/releases/download/v1.4.1/robo3t-1.4.1-windows-x86_64-122dbd9.zip'
$checksum64 = '70dee35877def8d0a6e099c39ce8428049166b09ff581ea8a469180696f31466'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
