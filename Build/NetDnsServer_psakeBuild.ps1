properties {
    $scriptModule = "$PSScriptRoot\..\NetDnsServer\NetDnsServer.psm1"
}

task default -depends Analyze, Test

task Analyze {
    $saResults = Invoke-ScriptAnalyzer -Path $scriptModule -Severity @('Error') -ExcludeRule PSAvoidUsingWriteHost -Recurse -Verbose:$false
    if ($saResults) {
        $saResults | Format-List
        Write-Error -Message 'One or more [PSScriptAnalyzer] errors/warnings were found... Build cannot continue!'
    }
}

task Test {
    $testResults = Invoke-Pester -Path "$PSScriptRoot\..\Tests\" -Show All -PassThru -WarningAction SilentlyContinue
    if ($testResults.FailedCount -gt 0) {
        $testResults | Format-List
        Write-Error -Message 'One or more [Pester] tests failed... Build cannot continue!'
    }
}

task Deploy {
    Invoke-PSDeploy -Path "$PSScriptRoot\NetDnsServer.psdeploy.ps1" -Force -Verbose:$VerbosePreference
}