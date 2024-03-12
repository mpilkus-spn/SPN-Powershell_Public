# Function to check if the script is running with administrative privileges
function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

    return $currentUser.IsInRole($adminRole)
}

# Check if the script is running with administrative privileges
if (-not (Test-Admin)) {
    Write-Host "Script is not running with administrative privileges. Relaunching with elevated permissions..."
    
    # Relaunch the script with elevated permissions
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    
    # Exit the current instance of the script
    Exit
}

# Loop to repeatedly prompt the user for options
do {
    Clear-Host #Clear the Console Screen
    Write-Host "This Script Uses the HP Universal Printer Driver and installs printers that use IP printing"
    Write-Host "Last Modified: 03/12/2024 "
    Write-Host ""
    Write-Host "-----Menu-----"
    Write-Host "1. Install HP Universal PrintDriver."
    Write-Host "2. Install the printer driver."
    Write-Host "3. Check if the print driver is installed."
    Write-Host "4. Add your printer."
    Write-Host "5. Check if the printer has been added."
    Write-Host "6. End the script."

    $choice = Read-Host "Choose your option (1-6)"

    Switch ($choice) {
        1 {
            Write-Host "Installing HP Universal PrintDriver."
            $downloadPath = "C:\Users\techadmin\Downloads\upd-ps-x64-7.1.0.25570.exe"
            Invoke-WebRequest -Uri "https://ftp.hp.com/pub/softlib/software13/printers/UPD/upd-ps-x64-7.1.0.25570.exe" -OutFile $downloadPath
            Write-Host "Install complete"
            Start-Process -FilePath $downloadPath
        }
        2 {
            Write-Host "Installing the printer driver."
            pnputil.exe -a "C:\HP Universal Print Driver\ps-x64-7.1.0.25570\hpcu270v.inf"
            Add-PrinterDriver -Name "HP Universal Printing PS"
            Write-Host "Printer Driver Install Complete"
            pause # Pause to allow user to see the result
        }
        3 {
            Write-Host "Checking that the print driver is installed."
            Get-PrinterDriver
            pause # Pause to allow user to see the result 
        }
        4 {
            Write-Host "Adding your printer. Please enter the needed information."
            # Define printer information
            # Prompt user for input
            $printerName = Read-Host "Enter printer name (e.g., ptr-office-desk)"
            $driverName = "HP Universal Printing PS" #uses the HP Universal Printer Driver

            $portName = Read-Host "Enter printer port name"  # You may need to specify the correct port name for your printer
            $printerIPAddress = Read-Host "Enter printer IP address (e.g., 10.10.0.101)"

            # Install the printer driver
            Add-PrinterDriver -Name $driverName

            # Add the printer port (IP port)
            Add-PrinterPort -Name $portName -PrinterHostAddress $printerIPAddress

            # Add the printer using the specified driver and port
            Add-Printer -Name $printerName -DriverName $driverName -PortName $portName
            pause # Pause to allow user to see the result
        }
        5 {
            Write-Host "Checking to see if the printer has been added."
            Get-Printer
            pause # Pause to allow user to see the result
        }
        6 {
            Write-Host "Exiting Script."
            
        }
        Default {
            Write-Host "That is not a valid option"
            pause # Pause to allow user to see the result
        }
    }
} while ($choice -ne 6)
