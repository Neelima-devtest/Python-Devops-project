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
        sh 'python3 test_file.py'
      }
    }
  }
}
