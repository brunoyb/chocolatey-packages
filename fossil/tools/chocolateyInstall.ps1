$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url32 = 'https://www.fossil-scm.org/home/uv/fossil-w32-2.26.zip'
$checksum32 = 'f01f59ee8531ba3ff03dfaca4eee553b174fd51d55603007a1817a43e8c799bf'
$checksumType32 = 'sha256'
$url64 = 'https://www.fossil-scm.org/home/uv/fossil-w64-2.26.zip'
$checksum64 = 'aeeff280037cc107b0b912578c5b13c60cd5899c1ecc75085ad5c93883ba3653'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -Checksum $checksum32 `
                             -ChecksumType $checksumType32 `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
