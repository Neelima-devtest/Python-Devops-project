pipeline {
  agent any
  stages {
    stage("Install dependencies") {
      steps {
        sh 'pip install -r requirements.txt || true' //I have installed the dependencies.Might need  --break-system-packages in some environments. Could be unsafe. Alternate is to use virtualenv
      }
    }
    stage("Run files") {
      steps {
        sh 'pytest login_test.py --junitxml=reports/junit_report.xml --html=reports/html_report.html --self-contained-html ' // --alluredir=reports/allure-results  to get allure results too
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
      //allure([
      //  includeProperties: false,
      //  jdk: '',
      // commandline: 'Allure',
      //  results: [[path: 'reports/allure-results']]
      //])
      // Allure is exceedingly complicated -> install allure-pytest, allure cli on server and add allure cli in "manage jenkins -> "tools" -> "add azure cli"
    }
  }
}
