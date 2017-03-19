Import-Module AU

$releases = 'http://files.studio3t.com/changelog/changelog.txt'

function global:au_SearchReplace {
	@{
		'tools\chocolateyInstall.ps1' = @{
			"(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
			"(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
			"(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
			"(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}

function global:au_GetLatest {
	$downloadPage = Invoke-WebRequest -Uri $releases

	$re = '(.+) \(\d{2}-\w+-\d{4}\)'
	if ($downloadPage.Content -Match $re) {
		$version = $Matches[1]
		$url32 = "https://download.studio3t.com/studio-3t/windows/$version/studio-3t-x86.msi.zip"
		$url64 = "https://download.studio3t.com/studio-3t/windows/$version/studio-3t-x64.msi.zip"
	} else {
		throw "Can't match '$re'"
	}

	@{
		Version = $version
		URL32 = $url32
		URL64 = $url64
	}
}

Update-Package
