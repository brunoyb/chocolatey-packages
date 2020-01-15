$ErrorActionPreference = 'Stop'

$packageName = 'sbt'
$fileType = 'msi'
$silentArgs = '/quiet'
$url = 'https://github.com/sbt/sbt/releases/download/v1.3.7/sbt-1.3.7.msi'
$checksum = '4f3f1dd6b86cf7758967be8eda78d65ffd6258496ecbb824468ebe2098ee58bb'
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
