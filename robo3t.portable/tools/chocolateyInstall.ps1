$ErrorActionPreference = 'Stop'

$packageName = 'robo3t.portable'
$url64 = 'https://github.com/Studio3T/robomongo/releases/download/v1.4.2/robo3t-1.4.2-windows-x86_64-8650949.zip'
$checksum64 = '6f4123c7a1d5ee7121d5f1af942e48140bb6e40008040d4caa17878324e34050'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
