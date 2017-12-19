$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-12-19/2.1.0-11-ge2bb8d4/ag-2017-12-19_2.1.0-11-ge2bb8d4-x86.zip'
$checksum32 = '9327cdac63ce7304e327646eba5fd7c407094981ff7fd03950de08c5e8aeb7a2'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-12-19/2.1.0-11-ge2bb8d4/ag-2017-12-19_2.1.0-11-ge2bb8d4-x64.zip'
$checksum64 = 'b3b3399e8cb399ed3354144b896d9108f4eff0361888ac63005ae0aebac796f4'
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
