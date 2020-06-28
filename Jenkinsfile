pipeline {
	agent { label 'slave1' }
		stages {
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell ''''
						if (!(Get-Module -Name PSScriptAnalyzer -ListAvailable)) { \
							Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force \
							Import-Module -Name PSScriptAnalyzer \
						}
						else { \
							Import-Module -Name PSScriptAnalyzer \
						}
						.\\Build\\NetDnsServer_Build.ps1 -Task Analyze
					'''
				}
			}
			
			stage('TEST: Pester') {
				steps {
					powershell '.\\Build\\NetDnsServer_Build.ps1 -Task Test'
				}
			}
			
			stage('GIT tetDEV: Step-ModuleVersion') {
				steps {
					dir('C:\\testdev-powershell_GIT\\NetDnsServer') {
						sh 'git checkout testDEV'
						sh 'git branch'
						powershell '''
							Step-ModuleVersion -Path .\\NetDnsServer\\NetDnsServer.psd1 -by Build
							Test-ModuleManifest -Path .\\NetDnsServer\\NetDnsServer.psd1 | select Version
						'''
					}
				}
			}
		}
		
	post {
		always {
			cleanWs()
        }
	}
}