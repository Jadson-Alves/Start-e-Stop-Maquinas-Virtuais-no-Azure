Param(
[string]$VmName,
[string]$ResourceGroupName,
[ValidateSet("Iniciar", "Desligar")]
[string]$VmAction
)
# Autenticar na conta de automação
$Conn = Get-AutomationConnection -Name AzureRunAsConnection
Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID `
-ApplicationID $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint
# Iniciar VM
IF ($VmAction -eq "Iniciar") {
Start-AzureRmVM -Name $VmName -ResourceGroupName $ResourceGroupName
}
# Desligar VM
IF ($VmAction -eq "Desligar") {
Stop-AzureRmVM -Name $VmName -ResourceGroupName $ResourceGroupName -Force
}