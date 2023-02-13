$ErrorActionPreference = 'Stop'

$packageName = 'studio3t'
$url64 = 'https://download.studio3t.com/studio-3t/windows/2023.1.1/studio-3t-x64.zip'
$checksum64 = '82828400c93c73368893c392a0c2c7988a24a0c908b76c5b6749981e4fe34b54'
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
