pipeline {
    agent {
        dockerfile {
                filename 'Env.Dockerfile'
                dir 'Demo'
                additionalBuildArgs  '--build-arg version=1.0.1'
            }
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
         always{
            echo 'Archive artifact'
            archiveArtifacts artifacts: 'app/build/outputs/**'
         }

         success{
             echo "sucess"
         }

    }
}