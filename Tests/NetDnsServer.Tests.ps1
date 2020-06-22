Import-Module NetDnsServer

Describe 'Basic Unit Test (Parameters)' {
    Context "Parameter Validation -- Query-NetDnsServer" {
        It "ComputerName parameter is mandatory" {
            (Get-Command -Name Query-NetDnsServer).Parameters.ComputerName.Attributes.Mandatory | Should -Be $true
        }
        It "Default parameter is mandatory" {
            (Get-Command -Name Query-NetDnsServer).Parameters.Default.Attributes.Mandatory | Should -Be $true
        }
        It "Searchbase parameter is NOT mandatory" {
            (Get-Command -Name Query-NetDnsServer).Parameters.Searchbase.Attributes.Mandatory | Should -Be $false
        }
    }
}