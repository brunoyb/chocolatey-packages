Import-Module AU

$updateUrl = 'https://robomongo.org/download'

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
	$updatePage = Invoke-WebRequest -Uri $updateUrl -UseBasicParsing

	$re = 'robo3t-.+-windows-x86_64-.+\.zip$'
	$url64 = $updatePage.Links | Where-Object href -Match $re | Select-Object -First 1 -ExpandProperty href

	$version = $url64 -Split '-' | Select-Object -First 1 -Skip 1

	@{
		Version = $version
		URL64 = $url64
	}
}

Update-Package -ChecksumFor 64
