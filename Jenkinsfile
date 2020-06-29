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
					// no modules found here!
				}
			}
			
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell '''
						.\\Build\\NetDnsServer_Build.ps1 -Task Analyze
						"`n"
						Get-InstalledModule | select Name | Out-File C:\testmod1.txt
						Get-Module | select Name
					'''
				}
			}
			
			stage('TEST: Pester') {
				steps {
					powershell '''
						.\\Build\\NetDnsServer_Build.ps1 -Task Test
						"`n"
						Get-InstalledModule | select Name | Out-File C:\testmod1.txt -Append
						Get-Module | select Name
					'''
				}
			}
		}
}