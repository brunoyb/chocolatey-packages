$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'https://github.com/vim/vim-win32-installer/releases/download/v8.0.1431/gvim_8.0.1431_x86.exe'
$checksum = 'f9498a0b9055439f886f3e010a42f3abe336da635a3e1e589403ac235effc683'
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
