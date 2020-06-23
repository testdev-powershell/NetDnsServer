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
			
			stage('DIRECTORY: local Git (switch to testDEV) // Step-ModuleVersion') {
				steps {
					dir('C:\\testdev-powershell_GIT\\NetDnsServer') {
						sh 'git checkout testDEV'
						sh 'git branch'
						powershell 'Step-ModuleVersion -Path .\\NetDnsServer\\NetDnsServer.psd1 -by Build'
					}
				}
			}
			
			stage('Deploy: ProGet') {
				steps {
					dir('C:\\testdev-powershell_GIT\\NetDnsServer') {
						bat 'powershell.exe -Command ".\\Build\\NetDnsServer_Build.ps1 -Task Deploy"
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