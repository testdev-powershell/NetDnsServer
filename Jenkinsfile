pipeline {
	agent { label 'slave1' }		
		stages {
			stage('TEST: user') {
				steps {
					powershell '''
						$env:USERNAME
						$env:USERPROFILE
						whoami
						Get-InstalledModule
						Get-Module
						$env:PSModulePath
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