pipeline {
	agent { label 'slave1' }
		stages {
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell '''
						if (!(Get-Module -Name PSScriptAnalyzer -ListAvailable)) { \
							Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force \
							Import-Module -Name PSScriptAnalyzer \
						}
						else { \
							Import-Module -Name PSScriptAnalyzer \
						}
						Get-Module
						// .\\Build\\NetDnsServer_Build.ps1 -Task Analyze
					'''
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