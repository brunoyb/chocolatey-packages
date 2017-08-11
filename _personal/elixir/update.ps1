﻿Import-Module AU

$releases = 'https://github.com/elixir-lang/elixir/releases/latest'

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
			"(?i)(^\s*[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
			"(?i)(^\s*[$]checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
			"(?i)(^\s*[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
		}

		"$($Latest.PackageName).nuspec" = @{
			"(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`$1$($Latest.ReleaseNotes)`$2"
		}
	}
}

function global:au_GetLatest {
	$downloadPage = Invoke-WebRequest -Uri $releases

	$re = 'Precompiled\.zip$'
	$url = $downloadPage.Links | Where-Object href -Match $re | Select-Object -First 1 -Expand href

	$version = $url -Split '/|v' | Select-Object -Last 1 -Skip 1
	$url = 'https://github.com' + $url
	$releaseNotes = "https://github.com/elixir-lang/elixir/releases/tag/v${version}"

	@{
		Version = $version
		URL = $url
		ReleaseNotes = $releaseNotes
	}
}

Update-Package -ChecksumFor 32
