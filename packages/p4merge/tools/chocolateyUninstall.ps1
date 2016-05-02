$packageName = 'p4merge'
$fileType = 'msi'
$silentArgs = '/qn'

$local_key = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key6432 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'

$softwareName = 'Helix Visual Components'

[array] $key = Get-ItemProperty -Path @($machine_key6432, $machine_key, $local_key) `
                                -ErrorAction SilentlyContinue | ? { $_.DisplayName -Like $softwareName }

if ($key.Count -eq 1) {
	$key | % {
		$silentArgs = "$($_.PSChildName) $silentArgs"

		Uninstall-ChocolateyPackage -PackageName $packageName `
		                            -FileType $fileType `
		                            -SilentArgs $silentArgs
	}
}
