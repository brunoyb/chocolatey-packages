$ErrorActionPreference = 'Stop'

$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.6.0/Precompiled.zip'
$checksum = 'f848bc7f88f9c252b3610a9995679889ce18073d0f0a061533c12e622b2ac9e7'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
