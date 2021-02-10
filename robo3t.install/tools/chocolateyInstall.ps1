$ErrorActionPreference = 'Stop'

$packageName = 'robo3t.install'
$fileType = 'exe'
$silentArgs = '/S'
$url64 = 'https://github.com/Studio3T/robomongo/releases/download/v1.4.3-beta/robo3t-1.4.3-windows-x86_64-48f7dfde.exe'
$checksum64 = '3253dc26ff78e5808183de541c3fbee335095ddb1662e9c7a09aede58cd2dd2b'
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
