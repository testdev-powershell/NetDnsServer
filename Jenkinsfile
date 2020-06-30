pipeline {
	agent { label 'master' }		
		stages {
			stage('TEST: user') {
				steps {
					powershell '''
						$env:USERNAME
						$env:USERPROFILE
						$env:HOMEPATH
						$env:HOMEDRIVE
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
						.\\Helpers\\ModuleHelpers.ps1
						Get-InstalledModule
					'''
				}
			}
		}
}