pipeline {
  agent any
  options { ansiColor('xterm'); timestamps() }

  environment {
    PLAYWRIGHT_BROWSERS_PATH = "${WORKSPACE}/.pw-browsers"
    PIP_DISABLE_PIP_VERSION_CHECK = "1"
  }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Setup Python venv') {
      steps {
        sh '''
          python3 -m venv .venv
          . .venv/bin/activate
          python --version
          pip install --upgrade pip
        '''
      }
    }

    stage('Install deps & init browsers') {
      steps {
        sh '''
          . .venv/bin/activate
          pip install robotframework robotframework-browser robotframework-requests pyyaml
          rfbrowser init
        '''
      }
    }

    stage('Run Robot tests') {
      steps {
        sh '''
          . .venv/bin/activate
          robot -d results --variablefile config/dev.yaml -i smoke tests/
        '''
      }
    }
  }

  post {
    always {
      robot outputPath: 'results',
            outputFileName: 'output.xml',
            reportFileName: 'report.html',
            logFileName: 'log.html'

      archiveArtifacts artifacts: 'results/**', fingerprint: true
      junit testResults: 'results/xunit.xml', allowEmptyResults: true
    }
  }
}