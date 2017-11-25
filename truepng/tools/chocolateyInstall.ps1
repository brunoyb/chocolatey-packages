$ErrorActionPreference = 'Stop'

$packageName = 'truepng'
$url = 'http://x128.ho.ua/clicks/clicks.php?uri=TruePNG_0624.zip'
$checksum = '9b735e660e8a39c37bd8239e10f3dd74b39b9e251f70fd8273b82c7ffc835959'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir
