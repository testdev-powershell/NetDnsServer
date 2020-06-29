pipeline {
	agent { label 'slave1' }		
		stages {
			stage('Install Modules') {
				steps {
					powershell '''
						Write-Host "Getting installed modules"
						"`n"
						Get-InstalledModule
						"`n"
						Write-Host "Installing modules"
						.\\Helpers\\ModuleHelpers.ps1
						"`n"
						Write-Host "getting installed modules"
						"`n"
						Get-InstalledModule
					'''
				}
			}
			
			stage('Check Modules') {
				steps {
					powershell '''
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