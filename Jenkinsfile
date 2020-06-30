pipeline {
	agent { label 'master' }		
		stages {
			stage('TEST: user') {
				steps {
					powershell '''
						$env:USERNAME
						$env:USERPROFILE
						whoami
						Get-InstalledModule
						Get-Module
					'''
					// no modules found here!
				}
			}
			
			stage ('Remove-Modules') {
				steps {
					powershell '''
						Get-InstalledModule
					'''
				}
			}
		}
}