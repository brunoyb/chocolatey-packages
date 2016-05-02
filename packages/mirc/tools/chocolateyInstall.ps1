$packageName = 'mirc'
$installerType = 'EXE'
$url = 'http://www.mirc.com/get.php?version=734'
$silentArgs = '/S'
$validExitCodes = @(0, 2)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
