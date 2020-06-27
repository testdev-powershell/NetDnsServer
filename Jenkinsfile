pipeline {
	agent { label 'slave1' }
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
						
			stage('Deploy: ProGet') {
				environment {
						PROGET_FEED_API_KEY = credentials('PStdevAPI')
				}
				steps {
					powershell '''
						if (!(Get-PackageProvider NuGet)) { \
							Install-PackageProvider NuGet -Force \
							"`n"
							Import-PackageProvider NuGet -Force \
						}
						
						if (!(Get-PSRepository -Name PStdev)) { \
							Register-PSRepository -Name PStdev -SourceLocation 'http://192.168.1.211:8624/nuget/PStdev/' -PublishLocation 'http://192.168.1.211:8624/nuget/PStdev/' -InstallationPolicy Trusted \
						}
						
						Publish-Module -Path C:\\testdev-powershell_GIT\\NetDnsServer\\NetDnsServer -NuGetApiKey ${env:PROGET_FEED_API_KEY} -Repository PStdev -Force -Confirm:$false
						"`n"
						Find-Module -Repository PStdev
					'''
				}
			}
			
			stage ('GIT testDEV: Merge/Push') {
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
			
			stage ('GIT master: Merge/Push') {
				steps {
					dir ('C:\\testdev-powershell_GIT\\NetDnsServer') {
						sh '''
							testDEVfiles=$(ls -I Jenkinsfile)
							git checkout master
							git checkout testDEV $testDEVfiles
							git add .
							git commit -m "updating master from testDEV"
						'''
			
						sshagent(['GITgpowers']) {
							sh('git push origin master')
						}
						
						sh 'git checkout testDEV'
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