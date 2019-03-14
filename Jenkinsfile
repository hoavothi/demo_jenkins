pipeline {
    agent any

    stages {
        stage('Prepare Env') {
            agent {
                   dockerfile {
                           filename 'Env.Dockerfile'
                           additionalBuildArgs  '--build-arg version=1.0.1'
                       }
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