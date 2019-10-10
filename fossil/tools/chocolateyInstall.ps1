$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url64 = 'https://www.fossil-scm.org/home/uv/fossil-w64-2.10.zip'
$checksum64 = '986A44B483721F4F225EBD6574D98BA4C4EF5E467DD3BB303C0D48707EE1966E'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
