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
						
			stage ('GIT master: Merge/Push') {
				steps {
					dir('C:\\testdev-powershell_GIT\\NetDnsServer') {
						sh 'git add .'
						sh 'git commit -m "appending NetDnsServer.psd1 version update"'
						
						sshagent(['GITgpowers']) {
							sh('git push origin testDEV')
						}
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