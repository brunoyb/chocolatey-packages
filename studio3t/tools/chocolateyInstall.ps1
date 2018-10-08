$ErrorActionPreference = 'Stop'

$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/2018.4.6/studio-3t-x86-no-shell.zip'
$checksum32 = 'b358b8aafd01012a3abbd2e0cf6b3f3f048d44b7948d000dad911a3f998b742f'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/2018.4.6/studio-3t-x64.zip'
$checksum64 = '080b26d100c522a76f24a2ea45dd748ee0a0e77cbb4b6a5a2a12aee548e5e820'
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
