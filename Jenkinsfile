pipeline {
	agent { label 'slave1' }		
		stages {
			stage('Install Modules') {
				steps {
					powershell '.\\Helpers\\ModuleHelpers.ps1'
				}
			}
			
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell '''
						Get-Module
						.\\Build\\NetDnsServer_Build.ps1 -Task Analyze'
						Get-Module
					'''
				}
			}
			
			stage('TEST: Pester') {
				steps {
					powershell '''
						Get-Module
						.\\Build\\NetDnsServer_Build.ps1 -Task Test'
						Get-Module
					'''
				}
			}
		}
		
	post {
		always {
			cleanWs()
        }
	}
}