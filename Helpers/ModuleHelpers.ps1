# If needed, install and NuGet

if (!(Get-InstalledModule -Name NuGet -ErrorAction Ignore)) {
    Install-Module -Name NuGet -Scope CurrentUser -Force
}

# If needed, install the NuGet package provider

if (!(Get-PackageProvider NuGet)) {
    Install-PackageProvider NuGet -Force
}

# If needed, install all modules needed for this pipeline project

if (!(Get-InstalledModule -Name BuildHelpers -ErrorAction Ignore)) {
    Install-Module -Name BuildHelpers -Scope CurrentUser -Force
}

if (!(Get-PSRepository -Name PStdev)) {
    Register-PSRepository -Name PStdev -SourceLocation 'http://192.168.1.211:8624/nuget/PStdev/' -PublishLocation 'http://192.168.1.211:8624/nuget/PStdev/' -InstallationPolicy Trusted
}

if (!(Get-InstalledModule -Name NetDnsServer -ErrorAction Ignore)) {
    Install-Module -Name NetDnsServer -Repository PStdev -Scope CurrentUser -Force
}

if (!(Get-InstalledModule -Name Pester -ErrorAction Ignore)) {
    Install-Module -Name Pester -Scope CurrentUser -Force -SkipPublisherCheck
}

if (!(Get-InstalledModule -Name psake -ErrorAction Ignore)) {
    Install-Module -Name psake -Scope CurrentUser -Force
}

if (!(Get-InstalledModule -Name PSDeploy -ErrorAction Ignore)) {
    Install-Module -Name PSDeploy -Scope CurrentUser -Force
}

if (!(Get-InstalledModule -Name PSScriptAnalyzer -ErrorAction Ignore)) {
    Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force
}