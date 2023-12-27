# Get all physical disks in the system
$physicalDisks = Get-PhysicalDisk

# Gather information for physical disks
$physicalDisksInfo = foreach ($disk in $physicalDisks) {
    $driveLetter = (Get-Partition -DiskNumber $disk.DeviceID -ErrorAction SilentlyContinue | Get-Volume -ErrorAction SilentlyContinue).DriveLetter
    $model = $disk.Model
    $serialNumber = $disk.SerialNumber

    [PSCustomObject]@{
        DriveLetter = $driveLetter
        Model = $model
        SerialNumber = $serialNumber
    }
}

# Sort disks by drive letter
$sortedDisks = $physicalDisksInfo | Sort-Object -Property DriveLetter

# Output drive details
foreach ($disk in $sortedDisks) {
    "Drive Letter: $($disk.DriveLetter)"
    "Drive Model: $($disk.Model)"
    "Drive Serial Number: $($disk.SerialNumber)"
    "------------"
}
