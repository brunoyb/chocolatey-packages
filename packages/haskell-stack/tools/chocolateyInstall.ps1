$packageName = 'haskell-stack'
$url = 'https://github.com/commercialhaskell/stack/releases/download/v1.3.0/stack-1.3.0-windows-i386.zip'
$checksum = '590ee81454fd84fd0425399f6f284d10038ec6465eca7cfd9b81c419adb84e53'
$checksumType = 'sha256'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v1.3.0/stack-1.3.0-windows-x86_64.zip'
$checksum64 = 'a1d2bb040525b41055498d6b078e34089461444c7b7e66b760fe10a4b3bf2f8f'
$checksumType64 = 'sha256'
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
