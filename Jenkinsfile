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