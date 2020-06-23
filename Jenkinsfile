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
					powershell '''
						Install-PackageProvider NuGet -Force
						Import-PackageProvider NuGet -Force
						if (!(Get-PSRepository -Name PStdev)) { \
							Register-PSRepository -Name PStdev -SourceLocation 'http://192.168.1.211:8624/nuget/PStdev/' -PublishLocation 'http://192.168.1.211:8624/nuget/PStdev/' -InstallationPolicy Trusted \
						}
						C:\\testdev-powershell_GIT\\NetDnsServer\\Build\\NetDnsServer_Build.ps1 -Task Deploy
						Publish-Module -Path .\NetDnsServer -NuGetApiKey InbJe8TKTerNDuUnIeW5 -Repository PStdev
						Find-Module -Repository PStdev
					'''
				}
			}
			
			stage ('Test of previous Stage') {
				steps {
					powershell 'Get-PSRepository | select Name'
				}
			}
		}
	
	post {
		always {
			cleanWs()
        }
	}
}