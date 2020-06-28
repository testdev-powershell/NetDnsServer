pipeline {
	agent { label 'slave1' }
		stages {
			stage('TEST: PSScriptAnalyzer') {
			agent { label 'slave1' }
				steps {
					powershell '''
						.\\Build\\NetDnsServer_Build.ps1 -Task Analyze
					'''
				}
			}
			
			stage('TEST: Pester') {
				agent { label 'slave1' }
				steps {
					powershell '''
						.\\Build\\NetDnsServer_Build.ps1 -Task Test
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