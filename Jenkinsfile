pipeline {
	agent any		
		stages {
			stage('Install Modules') {
				steps {
					powershell '.\\Helpers\\ModuleHelpers.ps1'
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
		
	post {
		always {
			cleanWs()
        }
	}
}