# Load Azure AD Sync Tools Module [If Required!!!]
Import-module -Name 'C:\Program Files\Microsoft Azure Active Directory Connect\Tools\AdSyncTools'

# Confirm Module is Loaded
Get-Module -Name 'AdSyncTools'

# Triggers a synchronization cycle with an Initial policy type.
Start-ADSyncSyncCycle -PolicyType Initial

# Triggers a synchronization cycle with an Delta Changes policy type.
Start-ADSyncSyncCycle -PolicyType Delta
