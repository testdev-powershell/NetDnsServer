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
			
			stage('Step Module Manifest (by Build)') {
				when { branch testDEV}
				steps {
					dir('C:\\testdev-powershell_GIT\\NetDnsServer') {
						sh 'git branch'
					
						// bat 'powershell.exe -Command "Step-ModuleVersion -Path .\\NetDnsServer\\NetDnsServer.psd1 -By Build"'
					}
				}
			}
			
			stage('Del WORKSPACE') {
				steps {
					cleanWs()
				}
			}

		}
}