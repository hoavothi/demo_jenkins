pipeline {
    agent any
    stages {

        stage('Check 1') {
            steps {
               echo 'CHECK 1'
               sh 'make check'
            }
        }

        stage('Check 1') {
                    steps {
                       echo 'CHECK 1'
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