$packageName = 'haskell-stack'
$url = 'https://github.com/commercialhaskell/stack/releases/download/v1.1.0/stack-1.1.0-windows-i386.zip'
$checksum = 'c191dbb67b88461917c51f68f0ef61a07da85ad0'
$checksumType = 'sha1'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v1.1.0/stack-1.1.0-windows-x86_64.zip'
$checksum64 = '030bee7e96e3882321bb90ba45ee9aa117665188'
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
