$ErrorActionPreference = 'Stop'

$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.6.2/Precompiled.zip'
$checksum = 'e1469ed37fa40fb37f997d5b086dfd71381fc2664ce00d38d7dabafabdca14e8'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
