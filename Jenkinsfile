pipeline {
	agent { label 'slave1' }
		stages {
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell '''
						Uninstall-Module -Name PSScriptAnalyzer -Force -Confirm:$false
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