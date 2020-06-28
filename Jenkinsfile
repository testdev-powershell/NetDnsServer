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

						if (!(Get-Module -Name psake -ListAvailable)) { \
							Install-Module -Name psake -Scope CurrentUser -Force \
							Import-Module -Name psake \
						}
						else { \
							Import-Module -Name psake \
						}

						if (!(Get-Module -Name Pester -ListAvailable)) { \
							Install-Module -Name Pester -Scope CurrentUser -Force -SkipPublisherCheck \
							Import-Module -Name Pester \
						}
						else { \
							Import-Module -Name Pester \
						}

						if (!(Get-Module -Name PSDeploy -ListAvailable)) { \
							Install-Module -Name PSDeply -Scope CurrentUser -Force \
							Import-Module -Name PSDeploy \
						}
						else { \
							Import-Module -Name PSDeploy \
						}
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