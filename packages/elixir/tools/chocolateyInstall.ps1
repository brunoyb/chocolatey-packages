$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.4.0/Precompiled.zip'
$checksum = '60d077bc242e65f4f430beb43c968b5632dfb07ec89a7d689da254ffdc791b98'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
