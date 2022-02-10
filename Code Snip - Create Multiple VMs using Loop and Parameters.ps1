<#
===========================================================
Create 2 VMs by entering the RG when running the script.
This is using a For loop and Parameters.
===========================================================
From Microsoft Learn
https://docs.microsoft.com/en-us/learn/modules/automate-azure-tasks-with-powershell/8-exercise-create-resource-using-script
#>

param([string]$resourceGroup)

$adminCredential = Get-Credential -Message "Enter a username and password for the VM administrator."

For ($i = 1; $i -le 3; $i++)
{
    $vmName = "ConferenceDemo" + $i
    Write-Host "Creating VM: " $vmName
    New-AzVm -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCredential -Image UbuntuLTS
}

#: To execute the script run
./CreateVMs.ps1 [RGs Name]