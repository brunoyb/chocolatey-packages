$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.3.0/Precompiled.zip'
$checksum = 'd585c58eaf8fe7454e0a0fcb5ff5c7f7fa79a198'
$checksumType = 'sha1'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
