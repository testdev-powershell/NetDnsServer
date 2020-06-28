pipeline {
	agent { label 'slave1' }
		stages {
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell '''
						if (!(Get-InstalledModule -Name PSScriptAnalyzer)) { Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force; Import-Module -Name PSScriptAnalyzer } else { Import-Module -Name PSScriptAnalyzer }
						Get-InstalledModule
					'''
				}
			}
			
			stage ('Carryover Test') {
				steps {
					powershell '''
						Get-InstalledModule
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