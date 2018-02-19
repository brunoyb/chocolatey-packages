$ErrorActionPreference = 'Stop'

$packageName = 'robo3t.portable'
$url64 = 'https://download.robomongo.org/1.2.1/windows/robo3t-1.2.1-windows-x86_64-3e50a65.zip'
$checksum64 = '8618179480e5788c38ed81e8a804b24ee57bf7d2902a42cb9597763e96670889'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
