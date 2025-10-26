pipeline {
  agent any
  environment {
    DOCKERHUB_CRED = credentials('ecommproject_cred') // set this credential in Jenkins
    DEV_REPO = "aswinitinku/ecomm-react-app-dev"
    PROD_REPO = "aswinitinku/ecomm-react-app-prod"
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build Image') {
      steps {
        sh 'chmod +x ${WORKSPACE}/build.sh'
        sh './build.sh'
      }
    }
    stage('Tag & Push') {
      steps {
        script {
          def tag = "${env.BRANCH_NAME == 'master' ? 'prod' : 'dev'}"
          def targetRepo = env.BRANCH_NAME == 'master' ? env.PROD_REPO : env.DEV_REPO
          sh "docker tag react-static-app:latest ${targetRepo}:latest"
          sh "echo $DOCKERHUB_CRED_PSW | docker login -u $DOCKERHUB_CRED_USR --password-stdin"
          sh "docker push ${targetRepo}:latest"
        }
      }
    }
  }
  post {
    always {
      sh 'docker image prune -f'
    }
  }
}

