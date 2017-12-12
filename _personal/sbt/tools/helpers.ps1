function Uninstall-OutdatedVersion() {
	[array] $key = Get-UninstallRegistryKey -SoftwareName 'sbt*'

	if ($key.Count -eq 1) {
		$key | ForEach-Object {
			Write-Host "A sbt package was found and needs to be uninstalled before proceeding with the upgrade."

			$fileType = 'msi'
			$silentArgs = "$($_.PSChildName) /quiet"
			$file = ''
			$validExitCodes = @(0)

			Uninstall-ChocolateyPackage -PackageName $packageName `
			                            -FileType $fileType `
			                            -SilentArgs $silentArgs `
			                            -File $file `
			                            -ValidExitCodes $validExitCodes
		}
	}
}
