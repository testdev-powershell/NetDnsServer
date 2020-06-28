[CmdletBinding (
)]

Param (
[string[]]
$Task = 'default'
)

$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent

<<<<<<< HEAD
if (!(Get-Module -Name Pester -ListAvailable)) {
    Install-Module -Name Pester -Scope CurrentUser -Force
}
if (!(Get-Module -Name psake -ListAvailable)) {
    Install-Module -Name psake -Scope CurrentUser -Force
}
if (!(Get-Module -Name PSDeploy -ListAvailable)) {
    Install-Module -Name PSDeploy -Scope CurrentUser -Force
}

=======
>>>>>>> testDEV
Invoke-psake -buildFile "$PSScriptRoot\NetDnsServer_psakeBuild.ps1" -taskList $Task -Verbose:$VerbosePreference

if ($psake.build_success -eq $false) {
    EXIT 1
}
else {
    EXIT 0
}