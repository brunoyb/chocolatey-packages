Import-Module AU

$updateUrl = 'http://www.swi-prolog.org/download/stable'

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
	}
}

function global:au_GetLatest {
	$updatePage = Invoke-WebRequest -Uri $updateUrl

	$re = 'swipl-(.+)\.(x64|x86)\.exe$'
	$url = $updatePage.Links | Where-Object href -Match $re | Select-Object -First 2 -ExpandProperty href

	$version = $url[0] -Split 'swipl-|\.(x64|x86)' -Replace '-', '.' | Select-Object -Last 1 -Skip 2
	$url32 = 'http://www.swi-prolog.org' + $url[1]
	$url64 = 'http://www.swi-prolog.org' + $url[0]

	@{
		Version = $version
		URL32 = $url32
		URL64 = $url64
	}
}

Update-Package
