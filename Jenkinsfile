pipeline {
	agent any		
		stages {
			stage('Install Modules') {
				steps {
					powershell '.\\Helpers\\ModuleHelpers.ps1'
				}
			}
			
			stage ('test of modules') {
				steps {
					powershell '''
						Get-InstalledModule
					'''
				}
			}
			
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell '.\\Build\\NetDnsServer_Build.ps1 -Task Analyze'
				}
			}
			
			stage ('test of module import') {
				steps {
					powershell '''
						Import-Module NetDnsServer
						Get-Module
					'''
				}
			}
		}
		
	post {
		always {
			cleanWs()
        }
	}
}