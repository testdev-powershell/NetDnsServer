Import-Module 'C:\Program Files\WindowsPowerShell\Modules\NuGet' -WarningAction Ignore

if (!(Get-PSRepository -Name PStdev)) {
    Register-PSRepository -Name PStdev -SourceLocation 'http://192.168.1.211:8624/nuget/PStdev/' -PublishLocation 'http://192.168.1.211:8624/nuget/PStdev/' -InstallationPolicy Trusted
}

Deploy PStdev {
    By PSGalleryModule {
        FromSource $PSScriptRoot\..\NetDnsServer
        To PStdev
        WithOptions @{
            ApiKey = "InbJe8TKTerNDuUnIeW5" # <-- API Key from ProGet
        }
    }
}