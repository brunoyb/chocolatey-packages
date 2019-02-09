$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2019-01-19/2.2.0-9-g7c70fe3/ag-2019-01-19_2.2.0-9-g7c70fe3-x86.zip'
$checksum32 = 'e859f4b5d2a2f90cdef6adf5a5ad0b1849d76423e68dbde4fe09eabf3f683695'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2019-01-19/2.2.0-9-g7c70fe3/ag-2019-01-19_2.2.0-9-g7c70fe3-x64.zip'
$checksum64 = 'afbab670bce83b8b846920c0a35c7480fbc2ff9bf2ce2852d523aebe834e4a57'
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
