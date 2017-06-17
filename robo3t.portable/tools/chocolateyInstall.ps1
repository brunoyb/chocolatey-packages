$ErrorActionPreference = 'Stop'

$packageName = 'robo3t.portable'
$url64 = 'https://download.robomongo.org/1.1.1/windows/robo3t-1.1.1-windows-x86_64-c93c6b0.zip'
$checksum64 = '71ed7d585381b824403e5929bc1e6c3d04f6d22a7f3a8b5b7fb415a79971b04d'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
