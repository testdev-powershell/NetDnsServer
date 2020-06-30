pipeline {
	agent { label 'master' }		
		stages {
			stage('TEST: user') {
				steps {
					powershell '''
						$env:USERNAME
						$env:USERPROFILE
						whoami
						Get-InstalledModule
						Get-Module
					'''
					// no modules found here!
				}
			}
			
			stage ('Remove-Modules') {
				steps {
					powershell '''
						Uninstall-Module -Name NuGet -Force -Confirm:$false
						Uninstall-Module -Name BuildHelpers -Force -Confirm:$false
						Uninstall-Module -Name psake -Force -Confirm:$false
						Uninstall-Module -Name PSDeploy -Force -Confirm:$false
						Uninstall-Module -Name Pester -Force -Confirm:$false
						Uninstall-Module -Name NetDnsServer -Force -Confirm:$false
						Get-InstalledModule
					'''
				}
			}
			
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell '''
						.\\Build\\NetDnsServer_Build.ps1 -Task Analyze
						Get-InstalledModule
						Get-Module
					'''
				}
			}
			
			stage('TEST: Pester') {
				steps {
					powershell '''
						.\\Build\\NetDnsServer_Build.ps1 -Task Test
					'''
				}
			}
		}
}