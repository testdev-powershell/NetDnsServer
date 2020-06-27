pipeline {
	agent any
		stages {
			stage('TEST: PSScriptAnalyzer') {
				agent { label 'slave1' }
				steps {
					powershell '''
						// Install-Module PSScriptAnalyzer -Scope CurrentUser -Force
						// Import-Module PSScriptAnalyzer
						'.\\Build\\NetDnsServer_Build.ps1 -Task Analyze'
					'''
				}
			}
	
	post {
		always {
			cleanWs()
        }
	}
}