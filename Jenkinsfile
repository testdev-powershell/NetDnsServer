pipeline {
	agent { label 'slave1' }
		stages {
			stage ('Import Modules') {
				steps {
					powershell '''
						Install-Module PSScriptAnalyzer -Force
						Import-Module PSScriptAnalyzer
						Install-Module Pester -Force -SkipPublisherCheck
						Import-Module Pester
						Install-Module BuildHelpers -Force
						Import-Module BuildHelpers
					'''
				}
			}
			
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell ''''
						Import-Module PSScriptAnalyzer -Force
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