$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2020-01-11/2.2.0-22-ga509a81/ag-2020-01-11_2.2.0-22-ga509a81-x86.zip'
$checksum32 = 'a2190b35d250f77270c64ac1d39c466f0953d2dcfc14398c644ae152f48663af'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2020-01-11/2.2.0-22-ga509a81/ag-2020-01-11_2.2.0-22-ga509a81-x64.zip'
$checksum64 = 'aca9b259b07db3c799cf9acbe59256210fd8cdbfc60d54bf95fe1dc2cbf16495'
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
