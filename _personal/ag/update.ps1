Import-Module AU

$releases = 'https://github.com/JFLarvoire/the_silver_searcher/releases'

function global:au_SearchReplace {
	@{
		'tools\chocolateyInstall.ps1' = @{
			"(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
			"(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
		}
	}
}

function global:au_GetLatest {
	$downloadPage = Invoke-WebRequest -Uri $releases

	$re = 'ag.zip$'
	$url = $downloadPage.Links | Where-Object href -Match $re | Select-Object -First 1 -Expand href

	$version = $url -Split '/|-' | Select-Object -Last 1 -Skip 2
	$url = 'https://github.com' + $url

	@{
		Version = $version
		URL = $url
	}
}

Update-Package -ChecksumFor 32
