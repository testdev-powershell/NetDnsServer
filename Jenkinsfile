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
					bat 'powershell.exe -Command "Import-Module \'C:\\Program Files\\WindowsPowerShell\\Modules\\BuildHelpers\'; Step-ModuleVersion -Path C:\\testdev-powershell_GIT\\NetDnsServer\\NetDnsServer\\NetDnsServer.psd1 -By Build"'
				}
			}
	
			stage('PROD: ProGet Deploy') {
				steps {
					powershell '.\\Build\\NetDnsServer_Build.ps1 -Task Deploy'
				}
			}
			
			stage('Local: ProGet Package Download') {
				steps {
					downloadProgetPackage downloadFolder: '${WORKSPACE}', downloadFormat: 'zip', feedName: 'PStdev', groupName: '', packageName: 'NetDnsServer', version: 'Latest'
				}
			}

		}
}