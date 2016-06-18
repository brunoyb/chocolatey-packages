$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.2.6/Precompiled.zip'
$checksum = 'fb1cee26875399ef38b173049d16f0028bf3add7'
$checksumType = 'sha1'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
