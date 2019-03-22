pipeline {
    agent any
    environment {
            JENKINS_URL = "http://05d680ac.ngrok.io"
            DANGER_GITHUB_API_TOKEN = credentials("8d3575291fcf307dc38b0104ac936b635346de19")
    }

    stages {
        stage('PREPARE ENV'){
           steps{
               echo 'PREPARE ENV'
               sh 'make pre-env'
           }
        }

        stage('Check 1') {
            steps {
               echo 'CHECK 1'
               sh 'env | grep "GIT\\|NODE_\\|STAGE\\|BUILD\\|JOB_NAME\\|ghprbPullId\\|CHANGE_ID" > env.list'
               sh 'cat env.list'
               sh 'make check'
            }
        }
    }

    post{
         always{
            echo 'Archive artifact'
            archiveArtifacts artifacts: 'app/build/outputs/**'
         }

         success{
             echo "sucess"
         }
    }
}
