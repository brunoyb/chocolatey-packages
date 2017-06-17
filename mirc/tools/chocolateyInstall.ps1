$ErrorActionPreference = 'Stop'

$packageName = 'mirc'
$fileType = 'exe'
$silentArgs = '/S /NOBACKUP'
$url = 'https://www.mirc.com/get.php?version=749'
$checksum = '860a079ac167efa2ef3a13867bca86b6832cf61e2a00b410647fb8b64b5879f9'
$checksumType = 'sha256'
$validExitCodes = @(0, 1223)

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType `
                          -ValidExitCodes $validExitCodes
