$ErrorActionPreference = 'Stop'

$packageName = 'robo3t.portable'
$url64 = 'https://github.com/Studio3T/robomongo/releases/download/v1.4.0/robo3t-1.4.0-windows-x86_64-a61e33c.zip'
$checksum64 = '4f1a4024d435ae368d8281ab75a436892b12454019100b31f643607408269fb2'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
