$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-12-28/2.1.0-22-g5516568/ag-2017-12-28_2.1.0-22-g5516568-x86.zip'
$checksum32 = '599925de0e3e5a5aeeed7e5220067f293be2db06b910353810b296fabd7c22f0'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-12-28/2.1.0-22-g5516568/ag-2017-12-28_2.1.0-22-g5516568-x64.zip'
$checksum64 = '812d4c3e8ea29be055f91f66bdf06e5c26cbd1d90ed6b07ced096f95d91756c9'
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
