Import-Module AU

$updateUrl = 'https://www.scala-sbt.org/download.html'

function global:au_BeforeUpdate {
	$Latest.Checksum32 = Get-RemoteChecksum $Latest.URL sha256
	$Latest.ChecksumType32 = 'sha256'
}

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
	$updatePage = Invoke-WebRequest -Uri $updateUrl -UseBasicParsing

	$re = 'sbt-.+\.msi$'
	$url = $updatePage.Links | Where-Object href -Match $re | Select-Object -First 1 -ExpandProperty href

	$version = $url -Split '-|\.msi' | Select-Object -Last 1 -Skip 1
	$releaseNotes = "https://github.com/sbt/sbt/releases/tag/v${version}"

	@{
		Version = $version
		URL = $url
		ReleaseNotes = $releaseNotes
	}
}

Update-Package -ChecksumFor none -NoCheckChocoVersion
