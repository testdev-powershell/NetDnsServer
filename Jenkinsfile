pipeline {
	agent { label 'master' }		
		stages {
			stage('Install Modules') {
				steps {
					powershell '''
						Write-Host "Getting modules"
						Get-Module
						Write-Host "Getting installed modules"
						Get-InstalledModule
						Write-Host "Installing modules"
						.\\Helpers\\ModuleHelpers.ps1
						Write-Host "getting modules after"
						Get-Module
						Write-Host "getting installed modules"
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