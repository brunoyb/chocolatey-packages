Import-Module AU

. $PSScriptRoot\..\_scripts\all.ps1

$updateUrl = 'http://www.mirc.com/whatsnew.txt'

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
			"(?i)(^\s*[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
			"(?i)(^\s*[$]checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
			"(?i)(^\s*[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
		}
	}
}

function global:au_AfterUpdate {
	Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
	$updatePage = Invoke-WebRequest -Uri $updateUrl

	$re = '\d{2}/\d{2}/\d{4} - mIRC v(.+)'
	if ($updatePage.Content -Match $re) {
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
