pipeline {
    agent any
    environment {
            JENKINS_URL = "http://05d680ac.ngrok.io"
            DANGER_GITHUB_API_TOKEN = credentials("47dd3102-5334-441d-9e9b-640f5e844ca0")
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
