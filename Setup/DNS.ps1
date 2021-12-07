$Tenant = Get-Content .\Config.json | ConvertFrom-Json

Resolve-DnsName -Name $Tenant.Domain -Server $Tenant.DNS.Server.External

# Resolve MX records from public or internal DNS Server based on DNS Server configuration
Resolve-DnsName -Name $Tenant.DNS.FQDN -Type MX -Server $Tenant.DNS.Server.External

# Resolve TXT records from public or internal DNS Server based on DNS Server configuration
Resolve-DnsName -Name $Tenant.DNS.FQDN -Type TXT -Server $Tenant.DNS.Server.External

# Resolve CNAME records from public or internal DNS Server based on DNS Server configuration
Resolve-DnsName -Name $Tenant.DNS.FQDN -Type CNAME -Server $Tenant.DNS.Server.External

# Resolve List of CNAME records from public or internal DNS Server based on DNS Records configuration
$Tenant.DNS.Records | Resolve-DnsName -Type CNAME -Server $Tenant.DNS.Server.External | Format-Table -AutoSize

# Resolve List of SRV records from public or internal DNS Server based on DNS Records configuration
Resolve-DnsName -Name $Tenant.DNS.FQDN -Type SRV -Server $Tenant.DNS.Server.External | Format-Table -AutoSize