$packageName = 'pt'
$url32 = 'https://github.com/monochromegane/the_platinum_searcher/releases/download/v2.1.5/pt_windows_386.zip'
$checksum32 = '5756ebf64d3d65aa4ef7bb176f5170ea8abfd5e23bf349d7c64a408b2201732b'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/monochromegane/the_platinum_searcher/releases/download/v2.1.5/pt_windows_amd64.zip'
$checksum64 = '0f02db8eba977bc50b743ed18b4ba8efb769b7ade5f8a5c84e869d44117924bb'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -Checksum $checksum32 `
                             -ChecksumType $checksumType32 `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
