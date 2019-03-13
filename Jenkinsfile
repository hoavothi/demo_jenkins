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
          always{
                      echo 'Report unit test to jenkins!!!'
                      junit '**/test-result1s/**/*.xml'
               }

    }
}