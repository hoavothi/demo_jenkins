pipeline {
    agent any

    stages {
        stage('Prepare Env') {
            steps{
               echo 'Prepare enviroment'
               sh 'make pre'
            }

        }

        stage('Check') {
            agent{
                docker{
                  image 'fr/android-env'
                  args '-v $WORKSPACE:/project'
                }
            }

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