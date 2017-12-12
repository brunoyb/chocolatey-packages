$ErrorActionPreference = 'Stop'

$packageName = 'sbt'
$fileType = 'msi'
$silentArgs = '/quiet'
$url = 'https://github.com/sbt/sbt/releases/download/v1.0.4/sbt-1.0.4.msi'
$checksum = 'df8941c5f6b9cde7b8ae54574cf65932fcea304121eafa1bf25619d66b3dfd34'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

. "$toolsDir\helpers.ps1"

Uninstall-OutdatedVersion

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType
