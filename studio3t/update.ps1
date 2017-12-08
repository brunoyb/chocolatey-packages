Import-Module AU

. $PSScriptRoot\..\_scripts\all.ps1

$updateUrl = 'http://files.studio3t.com/changelog/changelog.txt'

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')"    = "`$1'$($Latest.PackageName)'"
			"(?i)(^\s*[$]url32\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
			"(?i)(^\s*[$]checksum32\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
			"(?i)(^\s*[$]checksumType32\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
			"(?i)(^\s*[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
			"(?i)(^\s*[$]checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
			"(?i)(^\s*[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
		}

		".\tools\chocolateyUninstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')" = "`$1'$($Latest.PackageName)'"
		}
	}
}

function global:au_AfterUpdate {
	Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
	$updatePage = Invoke-WebRequest -Uri $updateUrl

	$re = '(.+) \(\d{2}-\w+-\d{4}\)'
	if ($updatePage.Content -Match $re) {
		$version = $Matches[1]
		$url32 = "https://download.studio3t.com/studio-3t/windows/$version/studio-3t-x86-no-shell.zip"
		$url64 = "https://download.studio3t.com/studio-3t/windows/$version/studio-3t-x64.zip"
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
