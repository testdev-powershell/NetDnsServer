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
	
			stage('Testing PSRepo') {
				steps {
					powershell '.\\Build\\NetDnsServer_Build.ps1 -Task Deploy'
				}
			}

		}
}