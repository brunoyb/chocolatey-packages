$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-10-23/2.1.0-5-g1791664/ag-2017-10-23_2.1.0-5-g1791664-x86.zip'
$checksum32 = '92dd6ec36f260632f788aa6b570194b874a8fe3740f9d8b2e0f02ba444e9dd3f'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-10-23/2.1.0-5-g1791664/ag-2017-10-23_2.1.0-5-g1791664-x64.zip'
$checksum64 = '5580e4321584377247600a8ca56b4e130c17dfb980640170079dfb38dc4a9f7b'
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
