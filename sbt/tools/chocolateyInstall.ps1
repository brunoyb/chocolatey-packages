$ErrorActionPreference = 'Stop'

$packageName = 'sbt'
$fileType = 'msi'
$silentArgs = '/quiet'
$url = 'https://github.com/sbt/sbt/releases/download/v1.11.0/sbt-1.11.0.msi'
$checksum = 'f76325358406d043c4343d61ddfc1d2ec05a1456272358eed72cb8e54ed861b3'
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
