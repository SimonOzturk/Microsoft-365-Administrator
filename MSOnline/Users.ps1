using namespace System.Management.Automation

Import-Module -Name 'MSOnline'

# List available commands inside of the Module
Get-Command -Module 'MSOnline'

# List available commands inside of the Module with Wildcard
Get-Command -Module 'MSOnline' -Name '*User*'

# Popup Logon Screen
# Connect-MsolService

$Tenant = Get-Content .\Config.json | ConvertFrom-Json

$Credential = [PSCredential]::new($Tenant.AzureAD.Admin.UserName, (ConvertTo-SecureString $Tenant.AzureAD.Admin.Password -AsPlainText -Force ))
# Silent Login
Connect-MsolService -Credential $Credential

# List Users
Get-MsolUser

# List Groups
Get-MsolGroup

# Export Groups to Json
Get-MsolGroup | ConvertTo-Json | Out-File .\MSOnline\Groups.json

# List Products Sku
Get-MsolAccountSku | Format-Table -AutoSize

# List Unlicensed Users and Assign License to them
Get-MsolUser -UnlicensedUsersOnly | Set-MsolUserLicense -AddLicenses 'M365x722330:ENTERPRISEPREMIUM'

# Create Security Group for Limit Microsoft 365 Group Creation.
New-MsolGroup -DisplayName "Microsoft 365 Group Creators" -Description "Members of this group allow to Create Microsoft 365 Group"
