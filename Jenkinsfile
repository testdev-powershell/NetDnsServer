pipeline {
	agent { label 'master' }		
		stages {
			stage ('removing modules') {
				steps {
					powershell '''
						Uninstall-Module BuildHelpers -Force -Confirm:$false
						Uninstall-Module NetDnsServer -Force -Confirm:$false
						Uninstall-Module NuGet -Force -Confirm:$false
						Uninstall-Module Pester -Force -Confirm:$false
						Uninstall-Module psake -Force -Confirm:$false
						Uninstall-Module PSDeploy -Force -Confirm:$false
						Uninstall-Module PSScriptAnalyzer -Force -Confirm:$false
					'''
				}
			}
			
			stage('Install Modules') {
				steps {
					powershell '''
						Get-Module
						Get-InstalledModule
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