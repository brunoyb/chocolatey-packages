$ErrorActionPreference = 'Stop'

$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.7.4/Precompiled.zip'
$checksum = 'cbd3c24885c7d935ca6fa2b8fb99a7c74f6abc0abe2001b6ef8a7fd03cfc51c6'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
