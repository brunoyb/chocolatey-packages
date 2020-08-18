$ErrorActionPreference = 'Stop'

$packageName = 'mirc'
$fileType = 'exe'
$silentArgs = '/S /NOBACKUP'
$url = 'https://www.mirc.com/get.php?version=763'
$checksum = '00f5a7995e75917ab8bc620fb9e152817354f3e154b3398c6f2320891fa9c737'
$checksumType = 'sha256'
$validExitCodes = @(0, 1223)

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType `
                          -ValidExitCodes $validExitCodes
