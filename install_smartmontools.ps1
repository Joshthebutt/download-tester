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
# URL of the file to download
$url2 = "https://driveadviser.com/driveAdviser_remake/download/oldDaLogo.png"

# Path where you want to save the downloaded file
$outputPath2 = "C:\ProgramData\Drive Adviser\oldDaLogo.png"

# Check if the file already exists
if (-not (Test-Path -Path $outputPath)) {
    # File doesn't exist, proceed with downloading
    Invoke-WebRequest -Uri $url2 -OutFile $outputPath
} else {
    Write-Host "File already exists at $outputPath2. Skipping download."
}
# Check if Smartmontools is already installed
if (Test-Path "C:\Program Files\smartmontools") {
    Write-Host "Smartmontools is already installed."
}
else {
    # Define the download URL for the Smartmontools installer
    $downloadUrl = "https://github.com/Joshthebutt/download-tester/raw/main/smartmontools-7.4-1.win32-setup.exe"

    # Define the installation directory
    $installDir = "C:\Program Files\smartmontools"

    # Download the Smartmontools installer
    Invoke-WebRequest -Uri $downloadUrl -OutFile "smartmontools-7.4-1.win32-setup.exe"

    # Install Smartmontools
    Start-Process -FilePath "C:\Program Files\smartmontools\smartmontools-7.4-1.win32-setup.exe" -ArgumentList "/S /D=$installDir" -Wait

    # Clean up the installer
    Remove-Item "smartmontools-7.4-1.win32-setup.exe"

    Write-Host "Smartmontools has been installed to $installDir."
}

