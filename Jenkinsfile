pipeline {
	agent { label 'slave1' }		
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
						Get-InstalledModule
						Get-Module
					'''
				}
			}
		}
}