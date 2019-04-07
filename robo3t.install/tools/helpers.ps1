function Uninstall-OutdatedVersion() {
	[array] $key = Get-UninstallRegistryKey -SoftwareName 'Robo 3T*'

	if ($key.Count -eq 1) {
		$key | ForEach-Object {
			Write-Host 'Robo 3T needs to be uninstalled before upgrading.'

			$fileType = 'exe'
			$silentArgs = '/S'
			$file = $_.UninstallString

			Uninstall-ChocolateyPackage -PackageName $packageName `
			                            -FileType $fileType `
			                            -SilentArgs $silentArgs `
			                            -File $file
		}
	}
}
