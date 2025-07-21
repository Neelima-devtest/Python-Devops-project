pipeline {
  agent any
  stages {
    stage("Install dependencies") {
      steps {
        sh 'pip install -r requirements.txt || true'
      }
    }
    stage("Run files") {
      steps {
        sh 'pytest test_file.py --junitxml=report.xml --html=report.html'
      }
    }
  }
  post {
    always {
      junit 'report.xml'
      publishHTML(target: [
        allowMissing: false,
        alwaysLinkToLastBuild: true,
        keepAll: true,
        reportDir: '.',
        reportFiles: 'report.html',
        reportName: 'HTML report'
      ])
    }
  }
}
