# Define the file path and URL
# Make fileToCheck and downloadURL variable named unique per download
    #Example
    #$insta_1_fileToCheck = "C:\Users\techadmin\Downloads\InstaShare%202_for%20Windows_v1.3.11.2_Windows_230811113325.zip"
    #$insta_1_downloadURL = "https://esupportdownload.benq.com/esupport/PUBLIC%20DISPLAY%20PRODUCT/Software/InstaShare%202/InstaShare%202_for%20Windows_v1.3.11.2_Windows_230811113325.zip"
$destinationFolder = "C:\Users\techadmin\Downloads"
#Instashare 1
    $insta_1_downloadURL = "https://esupportdownload.benq.com/esupport/PUBLIC%20DISPLAY%20PRODUCT/Software/InstaShare/InstaShare_for%20Windows_v2.0.0.26_Windows_230330163335.zip"
    $insta_1_fileToCheck = "C:\Users\techadmin\Downloads\InstaShare_for Windows_v2.0.0.26_Windows_230330163335.zip"
#Instashare 2
    $insta_2_downloadURL = "https://esupportdownload.benq.com/esupport/PUBLIC%20DISPLAY%20PRODUCT/Software/InstaShare%202/InstaShare%202_for%20Windows_v1.3.13.0_Windows_231115142759.zip"
    $Insta_2_fileToCheck = "C:\Users\techadmin\Downloads\InstaShare%202_for%20Windows_v1.3.13.0_Windows_231115142759.zip"
#VCastSender
    $vcast_downloadURL = "https://www.viewsonicglobal.com/public/products_download/software/cd/vCastSender_for_Windows.zip"
    $vcast_fileToCheck = "C:\Users\techadmin\Downloads\vCastSender_for_Windows.zip"
#Hovercam
    $hovercam_downloadURL = "https://hovercam-softwares.s3.us-west-1.amazonaws.com/HCFlex11/win/HoverCamFlex11.msi"
    $hovercam_fileToCheck = "C:\Users\techadmin\Downloads\HoverCamFlex11.msi"
#Google Drive for Desktop
    $GDD_downloadURL = "https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe"
    $GDD_fileToCheck = "C:\Users\techadmin\Downloads\GoogleDriveSetup.exe"

# Check if InstaShare 1 file exists
if (-not (Test-Path -Path $insta_1_fileToCheck)) {
    # File doesn't exist, perform installation
    Write-Host "InstaShare 1 File not found, downloading and installing..."

    # Download the file
    Start-BitsTransfer -Source $insta_1_downloadURL -Destination $destinationFolder

    # Once downloaded, check if the file exists again
    if (Test-Path -Path $insta_1_fileToCheck) {
        Write-Host "InstaShare 1 Installation successful"
        
        # Start the downloaded file
        Start-Process -FilePath $insta_1_fileToCheck
        
        # Proceed with further tasks or exit the script
    } else {
        Write-Host "InstaShare 1 Installation failed"
        # Handle failure scenario, retry installation, or exit the script
    }
} else {
    # File exists, move on to the next task
    Write-Host "InstaShare 1 File already exists, moving on..."

    # Start the existing file
    Start-Process -FilePath $insta_1_fileToCheck

    # Proceed with further tasks
}

# Check if InstaShare 2 file exists
if (-not (Test-Path -Path $insta_2_fileToCheck)) {
    # File doesn't exist, perform installation
    Write-Host "InstaShare 2 File not found, downloading and installing..."

    # Download the file
    Start-BitsTransfer -Source $insta_2_downloadURL -Destination $destinationFolder

    # Once downloaded, check if the file exists again
    if (Test-Path -Path $insta_2_fileToCheck) {
        Write-Host "InstaShare 2 Installation successful"
        
        # Start the downloaded file
        Start-Process -FilePath $insta_2_fileToCheck
        
        # Proceed with further tasks or exit the script
    } else {
        Write-Host "InstaShare 2 Installation failed"
        # Handle failure scenario, retry installation, or exit the script
    }
} else {
    # File exists, move on to the next task
    Write-Host "InstaShare 2 File already exists, moving on..."

    # Start the existing file
    Start-Process -FilePath $insta_2_fileToCheck

    # Proceed with further tasks
}

# Check if VCastSender file exists
if (-not (Test-Path -Path $vcast_fileToCheck)) {
    # File doesn't exist, perform installation
    Write-Host "VCastSender File not found, downloading and installing..."

    # Download the file
    Start-BitsTransfer -Source $vcast_downloadURL -Destination $destinationFolder

    # Once downloaded, check if the file exists again
    if (Test-Path -Path $vcast_fileToCheck) {
        Write-Host "VCasterSender Installation successful"
        
        # Start the downloaded file
        Start-Process -FilePath $vcast_fileToCheck
        
        # Proceed with further tasks or exit the script
    } else {
        Write-Host "VCastSender Installation failed"
        # Handle failure scenario, retry installation, or exit the script
    }
} else {
    # File exists, move on to the next task
    Write-Host "VCastSender File already exists, moving on..."

    # Start the existing file
    Start-Process -FilePath $vcast_fileToCheck

    # Proceed with further tasks
}

# Check if Hovercam file exists
if (-not (Test-Path -Path $hovercam_fileToCheck)) {
    # File doesn't exist, perform installation
    Write-Host "Hovercam File not found, downloading and installing..."

    # Download the file
    Start-BitsTransfer -Source $hovercam_downloadURL -Destination $destinationFolder

    # Once downloaded, check if the file exists again
    if (Test-Path -Path $hovercam_fileToCheck) {
        Write-Host "Hovercam Installation successful"
        
        # Start the downloaded file
        Start-Process -FilePath $hovercam_fileToCheck
        
        # Proceed with further tasks or exit the script
    } else {
        Write-Host "Hovercam Installation failed"
        # Handle failure scenario, retry installation, or exit the script
    }
} else {
    # File exists, move on to the next task
    Write-Host "Hovercam File already exists, moving on..."

    # Start the existing file
    Start-Process -FilePath $hovercam_fileToCheck

    # Proceed with further tasks
}

# Check if Google Drive for Desktop file exists
if (-not (Test-Path -Path $GDD_fileToCheck)) {
    # File doesn't exist, perform installation
    Write-Host "Google Drive for Desktop File not found, downloading and installing..."

    # Download the file
    Start-BitsTransfer -Source $GDD_downloadURL -Destination $destinationFolder

    # Once downloaded, check if the file exists again
    if (Test-Path -Path $GDD_fileToCheck) {
        Write-Host "Google Drive for Desktop Installation successful"
        
        # Start the downloaded file
        Start-Process -FilePath $GDD_fileToCheck
        
        # Proceed with further tasks or exit the script
    } else {
        Write-Host "Google Drive for Desktop Installation failed"
        # Handle failure scenario, retry installation, or exit the script
    }
} else {
    # File exists, move on to the next task
    Write-Host "Google Drive for Desktop File already exists, moving on..."

    # Start the existing file
    Start-Process -FilePath $GDD_fileToCheck

    # Proceed with further tasks
}
