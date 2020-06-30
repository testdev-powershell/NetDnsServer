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
			
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell '.\\Build\\NetDnsServer_Build.ps1 -Task Analyze'
				}
			}
		}
}