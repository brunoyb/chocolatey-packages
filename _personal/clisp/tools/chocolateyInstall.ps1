$ErrorActionPreference = 'Stop'

$packageName = 'clisp'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'https://sourceforge.net/projects/clisp/files/clisp/2.49/clisp-2.49-win32-mingw-big.exe'
$checksum = 'fffc8b2530de351dc0051041109cade0155b0ac73953981c15eebce36911a1dc'
$checksumType = 'sha256'

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType
