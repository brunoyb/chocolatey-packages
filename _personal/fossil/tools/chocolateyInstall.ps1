$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url = 'https://www.fossil-scm.org/index.html/uv/fossil-w32-2.5.zip'
$checksum = 'cad1caf56db436ca2a29e7b4919459482832dea6f6f3114258d28cbbfbc6bcb6'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir
