Import-Module AU

$releases = 'http://www.mirc.com/whatsnew.txt'

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

	$re = '\d{2}/\d{2}/\d{4} - mIRC v(.+)'
	if ($downloadPage.Content -Match $re) {
		$version = $Matches[1].Trim()
		$url = 'https://www.mirc.com/get.php?version=' + $version.Replace('.', '')
	} else {
		throw "Can't match '$re'"
	}

	@{
		Version = $version
		URL = $url
	}
}

Update-Package -ChecksumFor 32
