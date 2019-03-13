pipeline {
    agent any
    stages {

        stage('Check') {
             agent{
                 docker { image 'node:7-alpine' }
             }
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