$ErrorActionPreference = 'Stop'

$packageName = 'robo3t.install'
$fileType = 'exe'
$silentArgs = '/S'
$url64 = 'https://github.com/Studio3T/robomongo/releases/download/v1.4.3-beta/robo3t-1.4.3-windows-x86_64-9345ea05.exe'
$checksum64 = '5dd7a38c842e93a904b507e5b78fe9a9dfe84508b7cc5b75b5d4b619466a61ef'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\helpers.ps1

Uninstall-OutdatedVersion

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url64bit $url64 `
                          -Checksum64 $checksum64 `
                          -ChecksumType64 $checksumType64
