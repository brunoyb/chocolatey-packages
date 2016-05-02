$packageName = 'mirc'
$fileType = 'exe'
$silentArgs = '/S /NOBACKUP'
$url = 'http://www.mirc.com/get.php?version=745'
$checksum = '8d8c2949756dd619c9bbb5ade7a04bc24d2ee40b'
$checksumType = 'sha1'
$validExitCodes = @(1223)

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType `
                          -ValidExitCodes $validExitCodes
