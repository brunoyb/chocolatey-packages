$ErrorActionPreference = 'Stop'

$packageName = 'robo3t.install'
$fileType = 'exe'
$silentArgs = '/S'
$url64 = 'https://download.robomongo.org/1.1.1/windows/robo3t-1.1.1-windows-x86_64-c93c6b0.exe'
$checksum64 = 'fc871b31f40d758aab40d29b56341f670940ef39de6f08a5cca7325480091c90'
$checksumType64 = 'sha256'

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url64bit $url64 `
                          -Checksum64 $checksum64 `
                          -ChecksumType64 $checksumType64
