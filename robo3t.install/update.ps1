Import-Module AU

$updateUrl = 'https://github.com/Studio3T/robomongo/releases/latest'

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')"    = "`$1'$($Latest.PackageName)'"
			"(?i)(^\s*[$]fileType\s*=\s*)('.*')"       = "`$1'$($Latest.FileType)'"
			"(?i)(^\s*[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
			"(?i)(^\s*[$]checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
			"(?i)(^\s*[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
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

	$re = 'robo3t-.+-windows-x86_64-[a-fA-F0-9]+\.exe$'
	$url64 = $updatePage.Links | Where-Object href -Match $re | Select-Object -First 1 -ExpandProperty href

	$version = $url64 -Split '-' | Select-Object -Last 1 -Skip 3
	$url64 = 'https://github.com' + $url64
	$releaseNotes = "https://github.com/Studio3T/robomongo/releases/tag/v${version}"

	@{
		Version = $version
		URL64 = $url64
		ReleaseNotes = $releaseNotes
	}
}

if ($MyInvocation.InvocationName -NE '.') {
	Update-Package -ChecksumFor 64
}
