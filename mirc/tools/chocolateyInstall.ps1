$ErrorActionPreference = 'Stop'

$packageName = 'mirc'
$fileType = 'exe'
$silentArgs = '/S /NOBACKUP'
$url = 'https://www.mirc.com/get.php?version=774'
$checksum = 'b16ee607469c84e5e1e4ee79027f20c4e6a4c4011e7cc1969e94bb54931958f8'
$checksumType = 'sha256'
$validExitCodes = @(0, 1223)

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType `
                          -ValidExitCodes $validExitCodes
