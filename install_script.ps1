#Install script for the software listed
#WAZUH IS NOT INSTALLING AS OF 10/30/2023
Write-Host "What Software Needs to be Installed?"
Write-Host "1. Instashare"
Write-Host "2. Instashare 2"
Write-Host "3. VcastSender"
Write-Host "4. Flexcam"
Write-Host "5. Google Drive for Desktop"
Write-Host "6. WAZUH"
#Install all
Write-Host "14. Install all"
#End Function
Write-Host "15. End Script"

# Create a variable to store the user's selection.
$SoftwareInstall = ""
# Repeat asking the user for a number until they select 15.
do {
    $SoftwareInstall = Read-Host -Prompt "Type a number 1-15"

    # If the user selects 15, end the script.
    if ($SoftwareInstall -eq 15) {
        break
    }

    # Install the software selected by the user.
    switch ($SoftwareInstall) {
        1 { Write-Host "Installing Instashare Now"
            Start-BitsTransfer -Source https://esupportdownload.benq.com/esupport/PUBLIC%20DISPLAY%20PRODUCT/Software/InstaShare%202/InstaShare%202_for%20Windows_v1.3.11.2_Windows_230811113325.zip -Destination "C:\Users\techadmin\Downloads"
            Write-Host "Installation Complete"
        }
        2 { Write-Host "Installing Instashare 2 Now"
            Start-BitsTransfer -Source https://esupportdownload.benq.com/esupport/PUBLIC%20DISPLAY%20PRODUCT/Software/InstaShare%202/InstaShare%202_for%20Windows_v1.3.13.0_Windows_231115142759.zip -Destination "C:\Users\techadmin\Downloads"
            Write-Host "Installation Complete"
        }
        3 { Write-Host "Installing VcastSender Now"
            Start-BitsTransfer -Source https://www.viewsonicglobal.com/public/products_download/software/cd/vCastSender_for_Windows.zip -Destination "C:\Users\techadmin\Downloads"
            Write-Host "Installation Complete"
        }
        4 { Write-Host "Installing Hovercam Software Now"
            Start-BitsTransfer -Source https://hovercam-softwares.s3.us-west-1.amazonaws.com/HCFlex11/win/HoverCamFlex11.msi -Destination "C:\Users\techadmin\Downloads"
            Write-Host "Installation Complete"
        }
        5 { Write-Host "Installing Google Drive for Desktop Now"
            Start-BitsTransfer -Source https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe -Destination "C:\Users\techadmin\Downloads"
            Write-Host "Installation Complete"
        }
    #Installs and runs WAZUH
        6 { Write-Host "Installing WAZUH Now" Invoke-Web
    #Gets the agent
           Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.6.0-1.msi -OutFile ${env.tmp}\wazuh-agent; msiexec.exe /i ${env.tmp}\wazuh-agent /q WAZUH_MANAGER='10.10.0.12' WAZUH_REGISTRATION_SERVER='10.10.0.12' 
    #Runs the agent
           NET START WazuhSvc
            Write-Host "Installation Complete"
        }
    #Installs all Software
        14 { 
            $confirmation = Read-Host -Prompt "Are you sure you want to install all of the software packages? (Y/N)"
            if ($confirmation -eq "Y") { Write-Host "Installing Software Now"
                Start-BitsTransfer -Source https://esupportdownload.benq.com/esupport/PUBLIC%20DISPLAY%20PRODUCT/Software/InstaShare%202/InstaShare%202_for%20Windows_v1.3.11.2_Windows_230811113325.zip -Destination "C:\Users\techadmin\Downloads"
                Start-BitsTransfer -Source https://esupportdownload.benq.com/esupport/PUBLIC%20DISPLAY%20PRODUCT/Software/InstaShare%202/InstaShare%202_for%20Windows_v1.3.13.0_Windows_231115142759.zip -Destination "C:\Users\techadmin\Downloads"
                Start-BitsTransfer -Source https://www.viewsonicglobal.com/public/products_download/software/cd/vCastSender_for_Windows.zip -Destination "C:\Users\techadmin\Downloads"
                Start-BitsTransfer -Source https://hovercam-softwares.s3.us-west-1.amazonaws.com/HCFlex11/win/HoverCamFlex11.msi -Destination "C:\Users\techadmin\Downloads"
                Start-BitsTransfer -Source https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe -Destination "C:\Users\techadmin\Downloads"
                Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.6.0-1.msi -OutFile ${env.tmp}\wazuh-agent; Start-Process msiexec.exe -ArgumentList "/i ${env.tmp}\wazuh-agent /q WAZUH_MANAGER='10.10.0.12' WAZUH_REGISTRATION_SERVER='10.10.0.12'" -Wait; Start-Service WazuhSvc
                Write-Host "Installation Complete"
            } else {
                Write-Host "Software installation canceled."
            }
        }
        default {
            Write-Host "Invalid selection."
        }
    }
} while ($SoftwareInstall -ne 15) Write-Host "Have a great day!"

# Script has ended.
