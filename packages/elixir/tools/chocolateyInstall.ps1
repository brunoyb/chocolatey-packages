$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.3.1/Precompiled.zip'
$checksum = 'c28964e2c0a9d6392510503754127a24482c5c44'
$checksumType = 'sha1'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
