param(
  [Parameter(Mandatory = $true)][string]$Url,
  [Parameter(Mandatory = $true)][string]$Token,
  [Parameter(Mandatory = $true)][string]$Domain,
  [Parameter(Mandatory = $true)][string]$Service,
  [Parameter(Mandatory = $true)][string]$EntityId
)

$ErrorActionPreference = "Stop"
$endpoint = "$($Url.TrimEnd('/'))/api/services/$Domain/$Service"
$headers = @{ Authorization = "Bearer $Token" }
$body = @{ entity_id = $EntityId } | ConvertTo-Json

Invoke-RestMethod -Uri $endpoint -Method Post -Headers $headers -ContentType "application/json" -Body $body | Out-Null
