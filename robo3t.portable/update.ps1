Import-Module AU

$download = 'https://robomongo.org/download'

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')"    = "`$1'$($Latest.PackageName)'"
			"(?i)(^\s*[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
			"(?i)(^\s*[$]checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
			"(?i)(^\s*[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
		}
	}
}

function global:au_GetLatest {
	$downloadPage = Invoke-WebRequest -Uri $download

	$re = 'robo3t-.+-windows-x86_64-.+\.zip$'
	$url64 = $downloadPage.Links | Where-Object href -Match $re | Select-Object -First 1 -Expand href

	$version = $url64 -Split '-' | Select-Object -First 1 -Skip 1

	@{
		Version = $version
		URL64 = $url64
	}
}

Update-Package -ChecksumFor 64
