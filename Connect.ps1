Import-Module -Name 'MSOnline'
Import-Module -Name 'AzureAD'
Import-Module -Name 'Microsoft.Online.SharePoint.PowerShell'
Import-Module -Name 'PnP.PowerShell'
Import-Module -Name 'MicrosoftTeams'
Import-Module -Name 'Microsoft.PowerApps.Administration.PowerShell'
Import-Module -Name 'Microsoft.PowerApps.PowerShell'
Import-Module -Name 'Microsoft.Xrm.OnlineManagementAPI'
Import-Module -Name 'Microsoft.Xrm.Tooling.CrmConnector.PowerShell'

#$Tenant = Get-Content .\Config.json  | ConvertFrom-Json -AsHashtable
$Tenant = Get-Content .\Config.json  | ConvertFrom-Json

Connect-MsolService -Credential $Tenant.AzureAD.Admin.Credential
Connect-AzureAD -Credential $Tenant.AzureAD.Admin.Credential
Connect-SPOService -Credential $Tenant.SharePoint.Admin.Credential -Url $Tenant.SharePoint.Admin.Url
Connect-PnPOnline -Url $Tenant.SharePoint.Admin.Url -UseWebLogin 
Connect-MicrosoftTeams -Credential $Tenant.Teams.Admin.Credential  
Add-PowerAppsAccount -Endpoint prod -Username $Tenant.PowerApps.Admin.UserName -Password (ConvertTo-SecureString $Tenant.PowerApps.Admin.Password -AsPlainText -Force )