$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url64 = 'https://www.fossil-scm.org/home/uv/fossil-w64-2.10.zip'
$checksum64 = '986a44b483721f4f225ebd6574d98ba4c4ef5e467dd3bb303c0d48707ee1966e'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
