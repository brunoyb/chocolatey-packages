$packageName = 'mirc'
$fileType = 'exe'
$silentArgs = '/S'

$local_key = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key6432 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'

$softwareName = 'mIRC'

[array] $key = Get-ItemProperty -Path @($machine_key6432, $machine_key, $local_key) `
                                -ErrorAction SilentlyContinue | ? { $_.DisplayName -Like $softwareName }

if ($key.Count -eq 1) {
	$key | % {
		$splitPosition = $_.UninstallString.IndexOf('_?=')

		$file = $_.UninstallString.Substring(0, $splitPosition - 1)

		Uninstall-ChocolateyPackage -PackageName $packageName `
		                            -FileType $fileType `
		                            -SilentArgs $silentArgs `
		                            -File $file
	}
}
