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

  }
}