pipeline {
	agent { label 'slave1' }
		stages {
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell '.\\Build\\NetDnsServer_Build.ps1 -Task Analyze'
				}
			}
			
			stage('TEST: Pester') {
				steps {
					powershell '''
						Import-Module Pester
						.\\Build\\NetDnsServer_Build.ps1 -Task Test'
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