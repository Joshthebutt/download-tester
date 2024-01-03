# Check if BurntToast module is installed
if (-not (Get-Module -ListAvailable -Name BurntToast)) {
    # Install BurntToast module from the PowerShell Gallery
    Install-Module -Name BurntToast -Scope CurrentUser -Force -Verbose
} else {
    Write-Host "BurntToast module is already installed."
}
$appName = "drive adviser"
$app = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq $appName }

if ($app -ne $null) {
    $app.Uninstall()
    Write-Host "$appName has been uninstalled."
} else {
    Write-Host "$appName is not installed on this system."
}

# Get the processes related to the specified program name
$processes = Get-Process | Where-Object { $_.ProcessName -eq $appName }

# Check if any processes related to the program are running
if ($processes) {
    # Stop each process related to the program
    foreach ($process in $processes) {
        Stop-Process -Id $process.Id -Force
        Write-Host "Stopped process $($process.ProcessName) with ID $($process.Id)"
    }
     # Download the image from an online source (e.g., URL)
    $imageUrl = "https://driveadviser.com/driveAdviser_remake/download/oldDaLogo.png"
    $localImagePath = "C:\ProgramData\Drive Adviser\oldDaLogo.png"

    Invoke-WebRequest -Uri $imageUrl -OutFile $localImagePath


    # Notification to alert the user about process completion
    $NotificationParams = @{
        AppLogo = "C:\ProgramData\Drive Adviser\oldDaLogo.png"  # Replace with the path to your custom image
        Text = "The $appName has been fully uninstalled. Thank you for updating to the new Drive Adviser!"
    }

    # Create and display the notification
    New-BurntToastNotification @NotificationParams
} else {
    Write-Host "No processes found for $appName"
}
