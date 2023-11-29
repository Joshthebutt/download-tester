# Get all physical disks in the system
$physicalDisks = Get-PhysicalDisk

# Gather information for physical disks
$physicalDisksInfo = foreach ($disk in $physicalDisks) {
    $driveLetter = (Get-Partition -DiskNumber $disk.DeviceID | Get-Volume).DriveLetter
    $model = $disk.Model
    $serialNumber = $disk.SerialNumber

    [PSCustomObject]@{
        DriveLetter = $driveLetter
        Model = $model
        SerialNumber = $serialNumber
    }
}

# Filter out items where DriveLetter is null
$filteredDisks = $physicalDisksInfo | Where-Object { $_.DriveLetter -ne $null }

# Sort disks by drive letter
$sortedDisks = $filteredDisks | Sort-Object -Property DriveLetter

# Output drive details to console
foreach ($disk in $sortedDisks) {
    "{'Drive Letter': $($disk.DriveLetter)"
    "'Drive Model': $($disk.Model)"
    "'Drive Serial Number': $($disk.SerialNumber)}"
    "------------"
}
