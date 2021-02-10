$ErrorActionPreference = 'Stop'

$packageName = 'robo3t.portable'
$url64 = 'https://github.com/Studio3T/robomongo/releases/download/v1.4.3-beta/robo3t-1.4.3-windows-x86_64-48f7dfde.zip'
$checksum64 = '15c0d1d5751d68023fcca0f9e0db14dc69ea4607c2a4c9645df10b380c1653dd'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
