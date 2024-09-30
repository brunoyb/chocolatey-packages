$ErrorActionPreference = 'Stop'

$packageName = 'studio3t'
$url64 = 'https://download.studio3t.com/studio-3t/windows/2024.4.0/studio-3t-x64.zip'
$checksum64 = '38c53a7c7ea04463fbd1fb8ff58c1c8265b43a6e60a1b81b873817aaa43c6629'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\helpers.ps1

Uninstall-OutdatedVersion

Install-ChocolateyZipPackage -PackageName $packageName `
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
