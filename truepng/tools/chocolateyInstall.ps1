$ErrorActionPreference = 'Stop'

$packageName = 'truepng'
$url = 'http://x128.ho.ua/clicks/clicks.php?uri=TruePNG_0625.zip'
$checksum = 'a20d7121bf377e9ddb2d7d04995bb4b032d523caeb7f7ea3360acad6bc5901ab'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir
