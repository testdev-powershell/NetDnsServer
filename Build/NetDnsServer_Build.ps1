[CmdletBinding (
)]

Param (
[string[]]
$Task = 'default'
)

$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent

Invoke-psake -buildFile "$PSScriptRoot\NetDnsServer_psakeBuild.ps1" -taskList $Task -Verbose:$VerbosePreference

if ($psake.build_success -eq $false) {
    EXIT 1
}
else {
    EXIT 0
}