$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-12-02/2.1.0-9-g3ad49be/ag-2017-12-02_2.1.0-9-g3ad49be-x86.zip'
$checksum32 = 'ab77506c4f363f783cd41fa5ac2b0e5480f0fe628596d4099ba0ac3c61adb370'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-12-02/2.1.0-9-g3ad49be/ag-2017-12-02_2.1.0-9-g3ad49be-x64.zip'
$checksum64 = 'a7875caafedb5c967b3f9ac1a68c1df39b05ade4e69deb43a4b911c9b747761e'
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
