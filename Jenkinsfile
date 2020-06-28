pipeline {
	agent { label 'slave1' }		
		stages {
			stage ('Remove-Modules') {
				steps {
					powershell '''
						Uninstall-Module -Name NuGet -Force -Confirm:$false
						Uninstall-Module -Name BuildHelpers -Force -Confirm:$false
						Uninstall-Module -Name psake -Force -Confirm:$false
						Uninstall-Module -Name PSDeploy -Force -Confirm:$false
					'''
				}
			}
		}
}