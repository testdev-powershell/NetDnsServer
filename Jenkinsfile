pipeline {
	agent { label 'slave1' }
		stages {
			stage('TEST: PSScriptAnalyzer') {
				agent { label 'slave1' }
				steps {
					powershell '''
						'.\\Build\\NetDnsServer_Build.ps1 -Task Analyze'
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