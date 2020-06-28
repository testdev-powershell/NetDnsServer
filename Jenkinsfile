pipeline {
	agent { label 'slave1' }
		stages {
			stage('Install Modules') {
				steps {
					powershell '.\\Helpers\\ModuleHelpers.ps1'
				}
			}
			
			stage ('Get-Modules Test') {
				steps {
					powershell '''
						Get-InstalledModule
						Get-Module
					'''
				}
			}
		}
}