    # Define the download URL for the Smartmontools installer
    $downloadUrl = "https://driveadviser.com/driveAdviser_remake/download/drive_adviser.msix"

    # Define the installation directory
    $installDir = "C:\programdata\drive adviser"

    # Download the Smartmontools installer
    Invoke-WebRequest -Uri $downloadUrl -OutFile "drive_adviser.msix"

    # Install Smartmontools
    Start-Process -FilePath "C:\programdata\drive adviser\drive_adviser.msix" -ArgumentList "/S /D=$installDir" -Wait



    Write-Host "Update has been installed to $installDir."
