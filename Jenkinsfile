pipeline {
    agent any

    environment {
        DANGER_GITHUB_API_TOKEN = 1812cdb041404bf15e5f5682ff99f9efad1701ee
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
               sh 'env'
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
