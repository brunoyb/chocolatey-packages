$ErrorActionPreference = 'Stop'

$packageName = 'mirc'
$fileType = 'exe'
$silentArgs = '/S /NOBACKUP'
$url = 'https://www.mirc.com/get.php?version=767'
$checksum = 'fd880d16e527227af14008a32488c70d21d3e391b9c95b4d34c37279e4ff56b9'
$checksumType = 'sha256'
$validExitCodes = @(0, 1223)

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType `
                          -ValidExitCodes $validExitCodes
