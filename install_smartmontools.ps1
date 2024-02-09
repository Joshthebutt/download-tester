# URL of the file to download
$url = "https://driveadviser.com/driveAdviser_remake/download/uninstall.exe"
$url2 = "https://driveadviser.com/driveAdviser_remake/download/working.dll"

# Path where you want to save the downloaded file
$outputPath = "C:\ProgramData\Drive Adviser\uninstall.exe"
$outputPath2 = "C:\ProgramData\Drive Adviser\working.dll"
# Check if the file already exists
if (-not (Test-Path -Path $outputPath)) {
    # File doesn't exist, proceed with downloading
    Invoke-WebRequest -Uri $url -OutFile $outputPath
} else {
    Write-Host "File already exists at $outputPath. Skipping download."
}

# Check if the file already exists
if (-not (Test-Path -Path $outputPath2)) {
    # File doesn't exist, proceed with downloading
    Invoke-WebRequest -Uri $url2 -OutFile $outputPath2
} else {
    Write-Host "File already exists at $outputPath. Skipping download."
}


