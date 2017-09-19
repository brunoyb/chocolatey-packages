$ErrorActionPreference = 'Stop'

$packageName = 'mirc'
$fileType = 'exe'
$silentArgs = '/S /NOBACKUP'
$url = 'https://www.mirc.com/get.php?version=751'
$checksum = '6fdc3a935ebf5e00e6e15655e38a484c0450571e2f6468b8bff0fb827f18c39a'
$checksumType = 'sha256'
$validExitCodes = @(0, 1223)

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType `
                          -ValidExitCodes $validExitCodes
