$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url64 = 'https://www.fossil-scm.org/home/uv/fossil-w64-2.11.zip'
$checksum64 = '4feb4dce04fac3f2c4446534982a1a6822e2e1aa77f1df71fdef8afe98fc52fc'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
