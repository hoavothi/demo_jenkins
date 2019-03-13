pipeline {
    agent any
    stages {

        stage('Initialize'){
                def dockerHome = tool 'MyDocker'
                env.PATH = "${dockerHome}/bin:${env.PATH}"
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