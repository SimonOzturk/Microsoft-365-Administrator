using namespace System.Management.Automation
using namespace System.Net

[ServicePointManager]::SecurityProtocol = [SecurityProtocolType]::Tls12
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned 
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted


Install-Module -Name 'PowerShellGet' -Force -SkipPublisherCheck

Install-Module -Name 'MSOnline' -Confirm:$false -Force
Install-Module -Name 'AzureAD' -Confirm:$false -Force
Install-Module -Name 'AzureADPreview' -Confirm:$false -Force
Install-Module -Name 'Microsoft.Online.SharePoint.PowerShell' -Confirm:$false -Force
Install-Module -Name 'PnP.PowerShell' -Confirm:$false -Force
Install-Module -Name 'MicrosoftTeams' -Confirm:$false -Force
Install-Module -Name 'Microsoft.PowerApps.Administration.PowerShell' -Confirm:$false -Force
Install-Module -Name 'Microsoft.PowerApps.PowerShell' -AllowClobber -Confirm:$false -Force
Install-Module -Name 'Microsoft.Xrm.OnlineManagementAPI' -Confirm:$false -Force
Install-Module -Name 'Microsoft.Xrm.Tooling.CrmConnector.PowerShell' -Confirm:$false -Force