$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2020-06-27/2.2.0-55-g5600c1b/ag-2020-06-27_2.2.0-55-g5600c1b-x86.zip'
$checksum32 = '64eca3d7b78de0bfcb26d435b7a13fbaab140723e9570d3d224379267c37692c'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2020-06-27/2.2.0-55-g5600c1b/ag-2020-06-27_2.2.0-55-g5600c1b-x64.zip'
$checksum64 = 'e2b14d1479d2ff9c2d717bd80807fc4cd3fb518ffbbf7822665ec7497005225e'
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
