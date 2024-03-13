# Function to check if PowerShell is running as an administrator
function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Function to clear the screen
function Clear-Screen {
    Clear-Host
}

# Get the name of the PC
$computerName = $env:COMPUTERNAME

# Check if PowerShell is running as an administrator
if (-not (Test-Admin)) {
    # Restart PowerShell as an administrator and run the script again
    Start-Process powershell -Verb RunAs -ArgumentList ('-noprofile', '-noexit', '-file', $MyInvocation.MyCommand.Path)
    exit
}

# Clear the screen
Clear-Screen

# Display the name of the PC
Write-Host "Checking for updates on computer: $computerName`n"

# Check for available updates
$updates = Get-WindowsUpdate -MicrosoftUpdate
$updatesCount = $updates.Count

if ($updatesCount -gt 0) {
    Write-Host "There are $updatesCount updates available for $computerName`n"
    Write-Host "Updates available:"
    
    # List the titles of updates available
    foreach ($update in $updates) {
        Write-Host "- $($update.Title)"
    }
} else {
    Write-Host "There are no updates available for $computerName."
}
