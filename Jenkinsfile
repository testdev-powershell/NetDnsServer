pipeline {
	agent { label 'slave1' }
		stages {
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell 'Get-InstalledModule'
				}
			}
		}
		
	post {
		always {
			cleanWs()
        }
	}
}