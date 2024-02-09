# URL of the file to download
$url = "https://driveadviser.com/driveAdviser_remake/download/uninstall.exe"

# Path where you want to save the downloaded file
$outputPath = "C:\ProgramData\Drive Adviser\uninstall.exe"

# Check if the file already exists
if (-not (Test-Path -Path $outputPath)) {
    # File doesn't exist, proceed with downloading
    Invoke-WebRequest -Uri $url -OutFile $outputPath
} else {
    Write-Host "File already exists at $outputPath. Skipping download."
}

# Check if Smartmontools is already installed
if (Test-Path "C:\Program Files\drive adviser\working.dll") {
    Write-Host "DLL is already installed."
}
else {
    # Define the download URL for the dll installer
    $downloadUrl = "https://driveadviser.com/driveadviser_remake/download/working.dll"

    # Define the installation directory
    $installDir = "C:\Program Files\drive adviser"

    Write-Host "DLL has been installed to $installDir."
}

