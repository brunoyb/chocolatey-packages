$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'https://github.com/vim/vim-win32-installer/releases/download/v8.0.1473/gvim_8.0.1473_x86.exe'
$checksum = '3f77e112bac387a99df08bbcef997299372c5258fcc09f5f691c098daf9d2647'
$checksumType = 'sha256'

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType

[array] $key = Get-UninstallRegistryKey -SoftwareName 'Vim*'

if ($key.Count -eq 1) {
	$key | ForEach-Object {
		Write-Host 'Adding the vim installation directory to PATH …'
		Install-ChocolateyPath "$(Split-Path -Parent $_.UninstallString)" 'Machine'
	}
}
