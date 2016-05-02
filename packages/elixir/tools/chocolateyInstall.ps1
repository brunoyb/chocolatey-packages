$packageName = 'elixir'
$url = 'https://github.com/elixir-lang/elixir/releases/download/v1.2.5/Precompiled.zip'
$checksum = '4bf8221e6776aec0e1fb58cbaef20327c9a1089c'
$checksumType = 'sha1'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Install-ChocolateyPath "$toolsDir\bin" 'Machine'
