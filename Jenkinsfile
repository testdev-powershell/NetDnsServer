pipeline {
	agent { label 'slave1' }		
		stages {
			stage('TEST: user info') {
				steps {
					powershell '''
						$env:USERNAME
						$env:USERPROFILE
						$env:HOMEPATH
						$env:HOMEDRIVE
						whoami
						Get-InstalledModule
					'''
				}
			}
			
			stage ('removing modules') {
				steps {
					powershell '''
						Uninstall-Module BuildHelpers -Force -Confirm:$false
						Uninstall-Module NetDnsServer -Force -Confirm:$false
						Uninstall-Module NuGet -Force -Confirm:$false
						Uninstall-Module Pester -Force -Confirm:$false
						Uninstall-Module psake -Force -Confirm:$false
						Uninstall-Module PSDeploy -Force -Confirm:$false
						Uninstall-Module PSScriptAnalyzer -Force -Confirm:$false
					'''
				}
			}
		}
}