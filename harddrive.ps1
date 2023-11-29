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

# Sort disks by drive letter
$sortedDisks = $physicalDisksInfo | Sort-Object -Property DriveLetter

# Convert drive details to JSON
$jsonOutput = $sortedDisks | ConvertTo-Json

# Output JSON formatted drive details
$jsonOutput
