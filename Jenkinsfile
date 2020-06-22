pipeline {
  agent any
  stages {
    stage('TEST: PSScriptAnalyzer') {
      steps {
        powershell '.\\Build\\NetDnsServer_Build.ps1 -Task Analyze'
      }
    }

    stage('TEST: Pester (posh)') {
      steps {
        powershell '.\\Build\\NetDnsServer_Build.ps1 -Task Test'
      }
    }

    stage('Step Module Manifest (patch)') {
      steps {
        bat 'powershell.exe -Command "Import-Module \'C:\\Program Files\\WindowsPowerShell\\Modules\\BuildHelpers\'"'
        bat(script: 'powershell.exe -Command "$ver = Test-ModuleManifest -Path .\\NetDnsServer\\NetDnsServer.psd1 | select Version"', returnStdout: true)
        bat 'powershell.exe -Command "$ver"'
      }
    }

  }
}