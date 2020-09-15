$ErrorActionPreference = 'Stop'

$packageName = 'robo3t.install'
$fileType = 'exe'
$silentArgs = '/S'
$url64 = 'https://github.com/Studio3T/robomongo/releases/download/v1.4.1/robo3t-1.4.1-windows-x86_64-122dbd9.exe'
$checksum64 = '1adb1bb0875861fab904f7f0734db3ffcfae1954943866535ebccb42fd381a70'
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
