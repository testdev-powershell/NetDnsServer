pipeline {
	agent { label 'slave1' }
		stages {
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell 'Get-PSRepository'
					powershell 'Get-Module'
				}
			}
		}
		
	post {
		always {
			cleanWs()
        }
	}
}