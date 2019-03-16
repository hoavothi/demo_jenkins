pipeline {
    agent any

    stages {

        stage('Prepare ENV'){
            steps{
               sh 'make envi'
            }
        }

        stage('Check') {
            steps {
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