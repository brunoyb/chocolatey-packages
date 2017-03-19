Import-Module AU

$releases = 'https://github.com/elixir-lang/elixir/releases'

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

	$re = 'Precompiled.zip$'
	$url = $downloadPage.Links | Where-Object href -Match $re | Select-Object -First 1 -Expand href

	$version = $url -Split '/|v' | Select-Object -Last 1 -Skip 1
	$url = 'https://github.com' + $url

	@{
		Version = $version
		URL = $url
	}
}

Update-Package -ChecksumFor 32
