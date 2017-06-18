Import-Module AU

$releases = 'https://github.com/phrase/phraseapp-client/releases'

function global:au_SearchReplace {
	@{
		'tools\chocolateyInstall.ps1' = @{
			"(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
			"(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}

function global:au_GetLatest {
	$downloadPage = Invoke-WebRequest -Uri $releases

	$re = 'phraseapp_windows_amd64.exe.zip$'
	$url = $downloadPage.Links | Where-Object href -Match $re | Select-Object -First 1 -Expand href

	$version = $url -Split '/' | Select-Object -Last 1 -Skip 1
	$url = 'https://github.com' + $url

	@{
		Version = $version
		URL = $url
	}
}

Update-Package -ChecksumFor 64
