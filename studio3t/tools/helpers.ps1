function Remove-ItemRetrying([string] $file, [int] $tries = 5) {
	$triesCount = 0
	do {
		try {
			Remove-Item $file
			$fileRemovedSuccessfully = $true
		} catch {
			$triesCount++
			if ($triesCount -ge $tries) {
				Write-Warning "Impossible to remove file $file after $tries attempts. Giving up..."
				break
			}
			Start-Sleep 5
		}
	} until ($fileRemovedSuccessfully)
}

function Uninstall-OutdatedVersion() {
	[array] $key = Get-UninstallRegistryKey -SoftwareName 'Studio 3T'

	if ($key.Count -eq 1) {
		$key | ForEach-Object {
			Write-Host 'Studio 3T needs to be uninstalled before upgrading.'

			if ([System.Version] $_.DisplayVersion -lt [System.Version] '5.7.0') {
				$fileType = 'msi'
				$silentArgs = "$($_.PSChildName) /quiet"
				$file = ''
			} else {
				$fileType = 'exe'
				$silentArgs = '-q -console'
				$file = $_.UninstallString
			}

			Uninstall-ChocolateyPackage -PackageName $packageName `
			                            -FileType $fileType `
			                            -SilentArgs $silentArgs `
			                            -File $file
		}
	}
}
