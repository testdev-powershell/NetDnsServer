pipeline {
	agent { label 'slave1' }
		stages {
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell '''
						if (!(Get-InstalledModule -Name PSScriptAnalyzer)) { Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force; Import-Module -Name PSScriptAnalyzer }
						else { Import-Module -Name PSScriptAnalyzer }

						if (!(Get-InstalledModule -Name psake)) { Install-Module -Name psake -Scope CurrentUser -Force; Import-Module -Name psake }
						else { Import-Module -Name psake }

						if (!(Get-InstalledModule -Name Pester)) { Install-Module -Name Pester -Scope CurrentUser -Force -SkipPublisherCheck; Import-Module -Name Pester }
						else { Import-Module -Name Pester }

						if (!(Get-InstalledModule -Name PSDeploy)) { Install-Module -Name PSDeply -Scope CurrentUser -Force; Import-Module -Name PSDeploy }
						else { Import-Module -Name PSDeploy }
						
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