$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.3.2/Precompiled.zip'
$checksum = '57149e38c34c0d1c2b12345d76f369f17d03d38d'
$checksumType = 'sha1'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
