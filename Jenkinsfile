pipeline {
	agent { label 'slave1' }		
		stages {
			stage('TEST: user') {
				steps {
					powershell '''
						$env:USERNAME
						$env:USERPROFILE
						whoami
						"`n"
						Get-InstalledModule | select Name
						"`n"
						Get-Module
					'''
				}
			}
			
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell '.\\Build\\NetDnsServer_Build.ps1 -Task Analyze'
				}
			}
			
			stage('TEST: Pester') {
				steps {
					powershell '.\\Build\\NetDnsServer_Build.ps1 -Task Test'
				}
			}
		}
}