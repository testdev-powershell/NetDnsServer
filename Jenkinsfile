pipeline {
	agent any
		stages {
			stage('Deploy: ProGet') {
				steps {
					bat 'powershell.exe -Command "Get-Module"'
					bat 'powershell.exe -Command "Get-PSRepository"'
					// bat 'powershell.exe -Command "Get-PackageProvider | select -ExpandProperty Name"'
					// bat 'powershell.exe -Command "Copy-Item -Path \'C:\\Program Files\\PackageManagement\\ProviderAssemblies\\\' -Destination $ENV:WORKSPACE -Recurse"'
					// bat 'powershell.exe -Command "Import-PackageProvider -Name NuGet"'
					bat 'powershell.exe -Command "Import-Module \'C:\\Program Files\\WindowsPowerShell\\Modules\\PowerShellGet\' -Force; Install-PackageProvider -Name "Nuget" -RequiredVersion "2.8.5.216" -Force; Register-PSRepository -Name "PSGallery" -SourceLocation \'https://www.powershellgallery.com/api/v2/\' -InstallationPolicy Trusted; Get-PSRepository'
					// bat 'powershell.exe -Command "Get-Module"'
					// bat 'powershell.exe -Command "Get-PackageProvider | select -ExpandProperty Name"'
					// bat 'powershell.exe -Command "Install-PackageProvider -Name "Nuget" -RequiredVersion "2.8.5.216" -Force"'
					// bat 'powershell.exe -Command "Get-PackageProvider | select -ExpandProperty Name"'
					// bat 'powershell.exe -Command "Register-PSRepository -Name PStdev -SourceLocation \'http://192.168.1.211:8624/nuget/PStdev/\' -PublishLocation \'http://192.168.1.211:8624/nuget/PStdev/\' -InstallationPolicy Trusted"'
					// bat 'powershell.exe -Command "Get-PSRepository"'
					// bat 'powershell.exe -Command "C:\\testdev-powershell_GIT\\NetDnsServer\\Build\\NetDnsServer_Build.ps1 -Task Deploy"'
				}
			}
		}
	
	post {
		always {
			cleanWs()
        }
	}
}