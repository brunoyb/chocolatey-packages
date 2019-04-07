$ErrorActionPreference = 'Stop'

$packageName = 'robo3t.portable'
$url64 = 'https://download-test.robomongo.org/windows/robo3t-1.3.1-windows-x86_64-7419c406.zip'
$checksum64 = 'aac3af87ea03ae1516e041fa48a26eb61d2e1ab17f2d24643980fe6178116232'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
