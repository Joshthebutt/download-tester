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
    Start-Process -FilePath "smartmontools-7.4-1.win32-setup.exe" -ArgumentList "/S /D=$installDir" -Wait

    # Clean up the installer
    Remove-Item "smartmontools-7.4-1.win32-setup.exe"

    Write-Host "Smartmontools has been installed to $installDir."
}

