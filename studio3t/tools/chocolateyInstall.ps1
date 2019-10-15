$ErrorActionPreference = 'Stop'

$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/2019.6.0/studio-3t-x86-no-shell.zip'
$checksum32 = '792f168ac7c5f4d22d1f81f59c0402890a01d6d4eef474722f46598ee7718ff3'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/2019.6.0/studio-3t-x64.zip'
$checksum64 = '2ac38ce7478fc768e770b15b86f7226a113eec84b2dd440af24c79b664693656'
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
