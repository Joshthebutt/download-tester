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

    # Notification to alert the user about process completion
    $NotificationParams = @{
        AppLogo = "C:\ProgramData\Drive Adviser\oldDaLogo.png"  # Replace with the path to your custom image
        Audio = "ms-winsoundevent:Notification.Default" # Sound to play (optional)
        Title = "Process Completed"
        Message = "The $appName processes have been stopped."
    }

    # Create and display the notification
    New-BurntToastNotification @NotificationParams
} else {
    Write-Host "No processes found for $appName"
}
