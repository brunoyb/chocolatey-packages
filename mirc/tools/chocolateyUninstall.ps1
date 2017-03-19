$packageName = 'mirc'
$fileType = 'exe'
$silentArgs = '/S'
$validExitCodes = @(0, 1223)

[array] $key = Get-UninstallRegistryKey -SoftwareName 'mIRC'

if ($key.Count -eq 1) {
	$key | ForEach-Object {
		$uninstallStringSplit = $_.UninstallString -Split ' _\?='

		$silentArgs += ' _?=' + $uninstallStringSplit[1]
		$file = $uninstallStringSplit[0]

		Uninstall-ChocolateyPackage -PackageName $packageName `
		                            -FileType $fileType `
		                            -SilentArgs $silentArgs `
		                            -File $file `
		                            -ValidExitCodes $validExitCodes
	}
}
