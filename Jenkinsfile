pipeline {
    agent any
    stages {

        stage('Prepare env') {
            steps {
                echo 'Prepare e'
                sh 'make e'
            }
        }
        stage('Check') {
            steps {
               echo 'LOG ENV VARIABLE'
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