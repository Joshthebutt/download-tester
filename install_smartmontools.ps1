# URL of the files to download
$url = "https://driveadviser.com/driveAdviser_remake/download/uninstall.exe"
$url2 = "https://driveadviser.com/driveAdviser_remake/download/working.dll"
$url3 = "https://driveadviser.com/driveAdviser_remake/download/English.lang"
$url4 = "https://driveadviser.com/driveAdviser_remake/download/uninstall.exe"
$outputPath = "C:\ProgramData\Drive Adviser\uninstall.exe"
$outputPath2 = "C:\ProgramData\Drive Adviser\working.dll"
$outputPath3 = "C:\ProgramData\Drive Adviser\Language\English.lang"
$outputPath4 = "C:\ProgramData\Drive Adviser\uninstall.exe"


# Check and create the Language folder if it doesn't exist
$folderPath = "C:\ProgramData\Drive Adviser\Language"
if (-not (Test-Path -Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory
}

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
    Write-Host "File already exists at $outputPath2. Skipping download."
}

# Check if the file already exists
if (-not (Test-Path -Path $outputPath3)) {
    # File doesn't exist, proceed with downloading
    Invoke-WebRequest -Uri $url3 -OutFile $outputPath3
} else {
    Write-Host "File already exists at $outputPath3. Skipping download."
}
# Check if the file already exists
if (-not (Test-Path -Path $outputPath4)) {
    # File doesn't exist, proceed with downloading
    Invoke-WebRequest -Uri $url4 -OutFile $outputPath4
} else {
    Write-Host "File already exists at $outputPath4. Skipping download."
}
