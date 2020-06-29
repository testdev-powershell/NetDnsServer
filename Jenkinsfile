pipeline {
	agent { label 'slave1' }		
		stages {
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