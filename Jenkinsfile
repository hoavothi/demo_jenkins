pipeline {
    agent any
    stages {
        agent {
                docker { image 'node:7-alpine' }
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
         success{
             echo "sucess"
         }

    }
}