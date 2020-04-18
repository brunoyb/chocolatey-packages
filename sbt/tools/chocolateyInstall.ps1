$ErrorActionPreference = 'Stop'

$packageName = 'sbt'
$fileType = 'msi'
$silentArgs = '/quiet'
$url = 'https://github.com/sbt/sbt/releases/download/v1.3.10/sbt-1.3.10.msi'
$checksum = 'd65722c6db148a10b0cee0e6afee1ba32830cf54d497365db20d1101d5acb9ca'
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
