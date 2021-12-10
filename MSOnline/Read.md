# MS Online Module Scripts

## Global Tenant Variale

```powershell
$Tenant = Get-Content .\Config.json | ConvertFrom-Json
```
```json
{
    "AzureAD": {
        "Domain": "M365x722330.onmicrosoft.com",
        "Admin": {
            "UserName": "admin@M365x722330.onmicrosoft.com",
            "Password": "3p%^3vMDjp!c",
            "Credential": "$null"
        }
    }
}
```

## Limit Microsoft 365 Group Creation

Create Security Group for Limit Microsoft 365 Group Creation.

```powershell
New-MsolGroup -DisplayName "Microsoft 365 Group Creators" -Description "Members of this group allow to Create Microsoft 365 Group"
```