Deploy Module {
    By PSGalleryModule {
        FromSource $PSScriptRoot\..\NetDnsServer
        To PStdev
        WithOptions @{
            ApiKey = "InbJe8TKTerNDuUnIeW5" # <-- API Key from ProGet
        }
    }
}