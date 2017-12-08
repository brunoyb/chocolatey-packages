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

function Uninstall-OutdatedVersionIfApplicable() {
	[array] $key = Get-UninstallRegistryKey -SoftwareName 'Studio 3T'

	if ($key.Count -eq 1) {
		$key | Where-Object { [System.Version] $_.DisplayVersion -lt [System.Version] '5.7.0' } | ForEach-Object {
			Write-Host "A studio3t package older than 5.7.0 was detected."
			Write-Host "It will be uninstalled before proceeding with the upgrade."

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
