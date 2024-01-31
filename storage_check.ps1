# Get information about all volumes
$volumes = Get-Volume

# Iterate through each volume and display storage information
foreach ($volume in $volumes) {
    $volumeLetter = $volume.DriveLetter
    $usedSpace = [math]::Round(($volume.Size - $volume.SizeRemaining) / 1GB, 2)
    $remainingSpace = [math]::Round($volume.SizeRemaining / 1GB, 2)

    Write-Host "Drive $volumeLetter - Used: ${usedSpace}GB, Remaining: ${remainingSpace}GB"
}
