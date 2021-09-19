Import-Module AU

$updateUrl = 'https://files.studio3t.com/changelog/changelog.txt'

function global:au_BeforeUpdate {
	$Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64 sha256
	$Latest.ChecksumType64 = 'sha256'
}

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')"    = "`$1'$($Latest.PackageName)'"
			"(?i)(^\s*[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
			"(?i)(^\s*[$]checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
			"(?i)(^\s*[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
		}

		".\tools\chocolateyUninstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')" = "`$1'$($Latest.PackageName)'"
		}
	}
}

function global:au_GetLatest {
	$updatePage = Invoke-WebRequest -Uri $updateUrl -UseBasicParsing

	$re = '\d{4}\.\d{1,2}\.\d{1,2}'
	if ($updatePage.Content -Match $re) {
		$version = $Matches[0]
		$url64 = "https://download.studio3t.com/studio-3t/windows/$version/studio-3t-x64.zip"
	} else {
		throw "Can't match '$re'"
	}

	@{
		Version = $version
		URL64 = $url64
	}
}

Update-Package -ChecksumFor 64
