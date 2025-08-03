pipeline {
  agent any
  stages {
    stage("Install dependencies") {
      steps {
        sh 'pip install -r requirements.txt || true' //I have installed the dependencies
      }
    }
    stage("Run files") {
      steps {
        sh 'pytest login_test.py --junitxml=reports/junit_report.xml --html=reports/html_report.html --self-contained-html --alluredir=reports/allure-results '
      }
    }
  }
  post {
    always {
      junit 'reports/junit_report.xml'
      publishHTML(target: [
        allowMissing: false,
        alwaysLinkToLastBuild: true,
        keepAll: true,
        reportDir: 'reports',
        reportFiles: 'html_report.html',
        reportName: 'HTML report'
      ])
      allure([
        includeProperties: false,
        jdk: '',
        results: [[path: 'reports/allure-results']]
      )]
    }
  }
}
