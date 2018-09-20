$ErrorActionPreference = 'Stop'

$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/2018.4.4/studio-3t-x86-no-shell.zip'
$checksum32 = '0f1aa934ac91469f58befa561aac04ff07a785c99f055e6ea143f80c0416cc17'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/2018.4.4/studio-3t-x64.zip'
$checksum64 = '0cc0d67e6bf718858473446329be00837dbdb5a4c6de8bee5efca7d1e392c155'
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
