Import-Module -Name 'MSOnline'
Import-Module -Name 'AzureADPreview'

New-MsolGroup -DisplayName "Microsoft 365 Group Creators" -Description "Members of this group allow to Create Microsoft 365 Group"

$Template = Get-AzureADDirectorySettingTemplate | Where-Object {$_.DisplayName -eq "Group.Unified"}
if(!($Setting = Get-AzureADDirectorySetting | Where-Object {$_.TemplateId -eq $Template.Id})) 
{
    $Setting = $Template.CreateDirectorySetting()
}
$Setting["EnableGroupCreation"] = "False"
$Setting["GroupCreationAllowedGroupId"] = (Get-AzureADGroup -SearchString "Microsoft 365 Group Creators").objectid
$Setting["GroupCreationAllowedGroupId"] = "d89ad825-7f05-490a-b3cb-47b322142634"
$Setting["EnableMIPLabels"] = "True" 
$Setting.Values
#New-AzureADDirectorySetting -DirectorySetting $Setting
Set-AzureADDirectorySetting -DirectorySetting $Setting