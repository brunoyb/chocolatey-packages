Import-Module AU

$updateUrl = 'https://s3-us-west-2.amazonaws.com/snapshots.mitmproxy.org?delimiter=/&prefix='

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

	$versions = ([xml] $updatePage.Content).ListBucketResult.CommonPrefixes.Prefix |
		ForEach-Object { $_ -Replace '/', '' } |
		Where-Object { $_ -Match '^[\d.]+$' } |
		ForEach-Object { [System.Version] $_ }

	$version = ($versions | Measure-Object -Maximum).Maximum.ToString()
	$url = "https://snapshots.mitmproxy.org/${version}/mitmproxy-${version}-windows-installer.exe"
	$releaseNotes = "https://github.com/mitmproxy/mitmproxy/releases/tag/v${version}"

	@{
		Version = $version
		URL = $url
		ReleaseNotes = $releaseNotes
	}
}

Update-Package -ChecksumFor 32
