$ErrorActionPreference = 'Stop'

$packageName = 'robo3t.install'
$fileType = 'exe'
$silentArgs = '/S'
$url64 = 'https://github.com/Studio3T/robomongo/releases/download/v1.3.1/robo3t-1.3.1-windows-x86_64-7419c406.exe'
$checksum64 = 'a79d2f717f96e13964201e8802ed5b9b2bcfa7ea0a901efb337c19a24bf4ef5f'
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
