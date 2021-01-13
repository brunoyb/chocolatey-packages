$ErrorActionPreference = 'Stop'

$packageName = 'robo3t.portable'
$url64 = 'https://github.com/Studio3T/robomongo/releases/download/v1.4.3-beta/robo3t-1.4.3-windows-x86_64-9345ea05.zip'
$checksum64 = 'ec60a311853f9e80765e23631f2f89a84f1617c84b25f0db3f60f28377f53f70'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
