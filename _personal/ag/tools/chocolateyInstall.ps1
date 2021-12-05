$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2020-07-05/2.2.0-58-g5a1c8d8/ag-2020-07-05_2.2.0-58-g5a1c8d8-x86.zip'
$checksum32 = '245fe805610c0c42a1e1957f763eccaf53f2f02a9ed7fc0bca0efa9a856533e7'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2020-07-05/2.2.0-58-g5a1c8d8/ag-2020-07-05_2.2.0-58-g5a1c8d8-x64.zip'
$checksum64 = 'ca1988c611872fd73affe95bd20652bc6ec51a31bb72ff8b8c28f0c1b9ecd25a'
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
