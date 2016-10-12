$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.3.4/Precompiled.zip'
$checksum = 'eac16c41b88e7293a31d6ca95b5d72eaec92349a1f16846344f7b88128587e10'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
