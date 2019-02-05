$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$installPath = Join-Path -Path $scriptDir -ChildPath \miniconda.exe
$condaDir = Join-Path -Path $scriptDir -ChildPath \miniconda
$conda = Join-Path -Path $condaDir -ChildPath \Scripts\conda.exe
$activate = Join-Path -Path $condaDir -ChildPath \Scripts\activate.bat
$environment = Join-Path -Path $condaDir -ChildPath \envs\notebook

if (![System.IO.File]::Exists($installPath)){
	echo "Downloading miniconda..."

	$url = "https://repo.continuum.io/miniconda/Miniconda2-4.5.12-Windows-x86_64.exe"

	$client = new-object System.Net.WebClient
	$client.DownloadFile($url, $installPath)

} 

if (![System.IO.Directory]::Exists($condaDir)) {
	echo "Installing miniconda..."
	. $installPath /InstallationType=JustMe /RegisterPython=0 /S /D=$condaDir | Out-Null
	. $conda env create --file environment.yml | Out-Null
}

echo "Sourcing environment..."
