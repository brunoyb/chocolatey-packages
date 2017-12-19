$ErrorActionPreference = 'Stop'

$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.5.3/Precompiled.zip'
$checksum = '70972b844c12bc1a3960136d628ab4f21ca87dd5539c544ebabe41d6c9239ba9'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
