<# 
Get-VMGuestStorage

.Description
    Get vm's network info
	russ 20/12/2016
	
.Acknowledgments 

    
.Example
	./Get-VMGuestStorage -vmName <vm> 
#>

# Set variables
[CmdletBinding()]
param (
[string]$vm = " "
)


# Option to run script with imput or request imput
if ($vm -eq " "){  
$Name = Read-Host "Please enter name of vm"
$m = Get-VM $Name
}
else{
$m = Get-VM -name $vm
}



# Get Guest Disk info
$m.Extensiondata.Guest.Disk | Select @{N="Name";E={$m.Name}},DiskPath, @{N="Capacity(MB)";E={[math]::Round($_.Capacity/ 1MB)}}, @{N="Free Space(MB)";E={[math]::Round($_.FreeSpace / 1MB)}}, @{N="Free Space %";E={[math]::Round(((100* ($_.FreeSpace))/ ($_.Capacity)),0)}}