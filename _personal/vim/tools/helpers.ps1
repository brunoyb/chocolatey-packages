function Get-VimExeDir([string] $InstallDir) {
	$vimRootDir = "$(Join-Path $InstallDir 'vim')"

	if (!(Test-Path $vimRootDir)) {
		return ''
	}

	$vimExePath = "$(Get-ChildItem -Path $vimRootDir -Include 'vim.exe' -Recurse | Select-Object -First 1 -ExpandProperty FullName)"

	if (!$vimExePath) {
		return ''
	}

	return "$(Split-Path -Parent $vimExePath)"
}
