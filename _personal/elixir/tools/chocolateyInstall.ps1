$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.4.4/Precompiled.zip'
$checksum = '3fc2cc2ec39315d9894a81b9d167029e4a9cfa5bb22edb3d7e0e66971d4e43ed'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
