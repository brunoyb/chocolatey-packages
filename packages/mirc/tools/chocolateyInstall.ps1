$packageName = 'mirc'
$fileType = 'exe'
$silentArgs = '/S /NOBACKUP'
$url = 'http://www.mirc.com/get.php?version=746'
$checksum = 'd99b89649888944364ad8bd69261d8e13434a479'
$checksumType = 'sha1'
$validExitCodes = @(0, 1223)

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType `
                          -ValidExitCodes $validExitCodes
