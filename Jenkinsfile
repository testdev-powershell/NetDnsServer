pipeline {
	agent any		
		stages {
			stage('Install Modules') {
				steps {
					powershell '.\\Helpers\\ModuleHelpers.ps1'
				}
			}
			
			stage ('test of modules') {
				powershell '''
					Get-InstalledModule
				'''
			}
		}
		
	post {
		always {
			cleanWs()
        }
	}
}