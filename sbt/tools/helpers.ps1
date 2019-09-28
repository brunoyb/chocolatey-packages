function Uninstall-OutdatedVersion() {
	[array] $key = Get-UninstallRegistryKey -SoftwareName 'sbt*'

	if ($key.Count -eq 1) {
		$key | ForEach-Object {
			Write-Host 'sbt needs to be uninstalled before upgrading.'

			$fileType = 'msi'
			$silentArgs = "$($_.PSChildName) /quiet"
			$file = ''

			Uninstall-ChocolateyPackage -PackageName $packageName `
			                            -FileType $fileType `
			                            -SilentArgs $silentArgs `
			                            -File $file
		}
	}
}
