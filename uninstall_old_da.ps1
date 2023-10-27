$appName = "drive adviser"
$app = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq $appName }

if ($app -ne $null) {
    $app.Uninstall()
    Write-Host "$appName has been uninstalled."
} else {
    Write-Host "$appName is not installed on this system."
}
