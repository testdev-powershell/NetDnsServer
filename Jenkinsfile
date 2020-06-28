pipeline {
	agent { label 'slave1' }
		stages {
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell '''
						Uninstall-Module -Name BuildHelpers -Force -Confirm:$false
						Uninstall-Module -Name Pester -Force -Confirm:$false
						Uninstall-Module -Name PSScriptAnalyzer -Force -Confirm:$false
						Get-InstalledModule
				}
			}
		}
		
	post {
		always {
			cleanWs()
        }
	}
}