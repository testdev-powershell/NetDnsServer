pipeline {
	agent { label 'master' }		
		stages {
			stage('Install Modules') {
				steps {
					powershell '.\\Helpers\\ModuleHelpers.ps1'
				}
			}
		}
	post {
		always {
			cleanWs()
        }
	}
}