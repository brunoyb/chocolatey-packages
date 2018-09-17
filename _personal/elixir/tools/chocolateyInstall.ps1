$ErrorActionPreference = 'Stop'

$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.7.3/Precompiled.zip'
$checksum = '219cc599cbb59aaece4347b1c4bb383c6e277f242ca88bc2e8a553aedaaa4c1c'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
