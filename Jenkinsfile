pipeline {
    agent any
    stages {

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