Invoke-RestMethod -Method Get -Uri 'https://jsonplaceholder.typicode.com/posts'

$Tenant = Get-Content .\Config.json  | ConvertFrom-Json -AsHashtable

<# Microsoft Graph from PowerShell #>
$Tenant.Graph.Token = (Invoke-RestMethod -Method Post -Uri $Tenant.Graph.Url -Body $Tenant.Graph.OAuth ).access_token
$Result = (Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/groups/" -Headers @{Authorization = "Bearer $($Tenant.Graph.Token)"}).value
$Result | Format-Table id,displayName


function Get-Graph {
    param (
        [ValidateSet('Get','Post','Delete','Patch')]
        [string]$Method = 'Get',
        [string]$Uri,
        [uri]$BaseUri = 'https://graph.microsoft.com/v1.0/'
    )
    $graphUri = [uri]::new($base,$Uri).ToString()
    $Tenant.Graph.Token = (Invoke-RestMethod -Method Post -Uri $Tenant.Graph.Url -Body $Tenant.Graph.OAuth ).access_token
    return (Invoke-RestMethod -Method $Method -Uri $graphUri -Headers @{Authorization = "Bearer $($Tenant.Graph.Token)"}).value
}

Get-Graph -Method Get -Uri 'groups'
Get-Graph -Method 'Get' -Uri 'users'
