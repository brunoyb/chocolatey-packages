$packageName = 'haskell-stack'
$url = 'https://github.com/commercialhaskell/stack/releases/download/v1.2.0/stack-1.2.0-windows-i386.zip'
$checksum = 'c2517b9210b023446fca44321fc5347db30a3b9bec2faf19e078069d161c13c6'
$checksumType = 'sha256'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v1.2.0/stack-1.2.0-windows-x86_64.zip'
$checksum64 = 'aa30b757777f6e1b888250a91c8ba986d60b9dfe094f1aa408bd7e90fa92cc8c'
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
