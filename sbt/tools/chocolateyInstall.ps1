$ErrorActionPreference = 'Stop'

$packageName = 'sbt'
$fileType = 'msi'
$silentArgs = '/quiet'
$url = 'https://github.com/sbt/sbt/releases/download/v1.11.3/sbt-1.11.3.msi'
$checksum = '86d4a70943f477d19e1cdc8f5524932493cb3dc1ec8e55ae0b7e367a6c7e3b14'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\helpers.ps1

Uninstall-OutdatedVersion

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType
