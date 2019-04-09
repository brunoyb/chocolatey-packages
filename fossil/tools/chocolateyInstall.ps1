$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url = 'https://www.fossil-scm.org/index.html/uv/fossil-w32-2.8.zip'
$checksum = '703c53a48f5589eaa55ecdd6fc2c2da0e9501ee395a3a8fd4e9bad1a22652255'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir
