$packageName = 'haskell-stack'
$url = 'https://github.com/commercialhaskell/stack/releases/download/v1.1.2/stack-1.1.2-windows-i386.zip'
$checksum = 'a68667c9d64fb65d8db5e00f3f8d0036e3b37a26'
$checksumType = 'sha1'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v1.1.2/stack-1.1.2-windows-x86_64.zip'
$checksum64 = 'ff0d12a7b7db5d5e398585b7a0c4d35b43a06013'
$checksumType64 = 'sha1'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $env:APPDATA 'local\bin')"
