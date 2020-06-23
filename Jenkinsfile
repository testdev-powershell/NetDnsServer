pipeline {
	agent any
		stages {
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
			
			stage('Step Module Manifest (by Build)') {
				steps {
					bat 'powershell.exe -Command "Import-Module \'C:\\Program Files\\WindowsPowerShell\\Modules\\BuildHelpers\'; Step-ModuleVersion -Path $ENV:WORKSPACE\\NetDnsServer\\NetDnsServer.psd1 -By Build"'
				}
			}
	
			stage('Testing PSRepo') {
				steps {
					powershell 'Get-Module'
				}
			}

		}
}