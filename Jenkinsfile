pipeline {
    agent any
    stages {

        stage('PREPARE ENV'){

           steps{
               echo 'PREPARE ENV'
               sh 'make pre-env'
           }
        }

        stage('DEPLOY'){
           steps {
               parallel(
                 Deploy1: {
                   echo 'CHECK 1'
                   sh 'make check'
                 },
                Deploy2: {
                   echo 'CHECK 2'
                   sh 'make check'
                 }
               )
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
