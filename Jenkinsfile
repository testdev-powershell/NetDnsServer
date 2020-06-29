pipeline {
	agent any		
		stages {
			stage('Install Modules') {
				steps {
					sh 'whoami'
				}
			}
			
			stage ('test of modules') {
				steps {
					powershell '''
						Get-InstalledModule | fl *
					'''
				}
			}
			
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell '.\\Build\\NetDnsServer_Build.ps1 -Task Analyze'
				}
			}
			
			stage('TEST: Pester') {
				steps {
					powershell '.\\Build\\NetDnsServer_Build.ps1 -Task Test'
				}
			}
		}
}