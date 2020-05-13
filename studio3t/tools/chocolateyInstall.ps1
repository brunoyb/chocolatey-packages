$ErrorActionPreference = 'Stop'

$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/2020.5.0/studio-3t-x86-no-shell.zip'
$checksum32 = 'af44c6414aae08b9713fa57a4fff52c3a8212861e7600639fef2d81d92cf4717'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/2020.5.0/studio-3t-x64.zip'
$checksum64 = '3694194b9046e4800c0926281ab5cc2509b3747e9306d3a6b2324f2909314043'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\helpers.ps1

Uninstall-OutdatedVersion

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -Checksum $checksum32 `
                             -ChecksumType $checksumType32 `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

$fileType = 'exe'
$silentArgs = '-q -console'
$file = Get-ChildItem $toolsDir -Include *.exe -Recurse | Select-Object -First 1

Install-ChocolateyInstallPackage -PackageName $packageName `
                                 -FileType $fileType `
                                 -SilentArgs $silentArgs `
                                 -File $file

TryRemove-Item $file
