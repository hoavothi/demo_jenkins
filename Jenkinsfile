pipeline {
    agent {
       label 'docker'
    }
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