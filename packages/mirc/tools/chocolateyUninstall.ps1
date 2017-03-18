$packageName = 'mirc'
$fileType = 'exe'
$silentArgs = '/S'

[array] $key = Get-UninstallRegistryKey -SoftwareName 'mIRC'

if ($key.Count -eq 1) {
	$key | ForEach-Object {
		$splitPosition = $_.UninstallString.IndexOf('_?=')

		$file = $_.UninstallString.Substring(0, $splitPosition - 1)

		Uninstall-ChocolateyPackage -PackageName $packageName `
		                            -FileType $fileType `
		                            -SilentArgs $silentArgs `
		                            -File $file
	}
}
