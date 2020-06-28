pipeline {
	agent { label 'slave1' }
		stages {
			stage('TEST: PSScriptAnalyzer') {
				steps {
					powershell 'if (Get-InstalledModule -Name Pester) {Write-Host Pester}'
				}
			}
		}
		
	post {
		always {
			cleanWs()
        }
	}
}