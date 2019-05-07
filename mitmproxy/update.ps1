Import-Module AU

$updateUrl = 'https://github.com/mitmproxy/mitmproxy/releases/latest'

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
			"(?i)(^\s*[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
			"(?i)(^\s*[$]checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
			"(?i)(^\s*[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
		}

		".\tools\chocolateyUninstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')" = "`$1'$($Latest.PackageName)'"
		}

		"$($Latest.PackageName).nuspec" = @{
			"(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`$1$($Latest.ReleaseNotes)`$2"
		}
	}
}

function global:au_GetLatest {
	$updatePage = Invoke-WebRequest -Uri $updateUrl -UseBasicParsing

	$re = 'v.+\.zip$'
	$url = $updatePage.Links | Where-Object href -Match $re | Select-Object -First 1 -ExpandProperty href

	$version = $url -Split 'v|\.zip' | Select-Object -Last 1 -Skip 1
	$url = "https://snapshots.mitmproxy.org/${version}/mitmproxy-${version}-windows-installer.exe"
	$releaseNotes = "https://github.com/mitmproxy/mitmproxy/releases/tag/v${version}"

	@{
		Version = $version
		URL = $url
		ReleaseNotes = $releaseNotes
	}
}

Update-Package -ChecksumFor 32
