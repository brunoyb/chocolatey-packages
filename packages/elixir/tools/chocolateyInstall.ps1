$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.4.2/Precompiled.zip'
$checksum = '3ff610166612db10d3f97895972882a6912e99628e31116d22406389c1de48cc'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
