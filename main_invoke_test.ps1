#This is the main script that test how the webinvoke command works for invoke test 1 and 2
$test1 = 'https://raw.githubusercontent.com/mpilkus-spn/SPN-Powershell_Public/main/invoke_test_1%2Cps1'
$test2 = 'https://raw.githubusercontent.com/mpilkus-spn/SPN-Powershell_Public/main/invoke_test_2.ps1'

# Prompt user to choose 1 or 2
do {
    Write-Host "To Break the script, type 15"
    Write-Host "Pick 1 or 2"

    $choice = Read-Host "Pick a number 1 or 2"

    if ($choice -eq '15') {
        Break
    }

    if ($choice -eq '1') {
        $scriptContent = Invoke-WebRequest -Uri $test1 | Select-Object -ExpandProperty Content
        Invoke-Command -ScriptBlock ([Scriptblock]::Create($scriptContent))
    }
    elseif ($choice -eq '2') {
        $scriptContent = Invoke-WebRequest -Uri $test2 | Select-Object -ExpandProperty Content
        Invoke-Command -ScriptBlock ([Scriptblock]::Create($scriptContent))
    }
    else {
        Write-Host "Invalid choice. Please select 1 or 2."
    }
} while ($true)
