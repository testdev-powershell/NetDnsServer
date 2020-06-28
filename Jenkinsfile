pipeline {
	agent { label 'slave1' }
		stages {
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell 'Get-PSRepository'
					powershell 'Import-Module PSScriptAnalyzer'
					powershell 'Import-Module psake'
					powershell 'Import-Module psdeploy'
					powershell 'Import-Module pester'
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