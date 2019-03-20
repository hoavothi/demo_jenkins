pipeline {
    agent any
    stages {
        stage('PREPARE ENV'){
           steps{
               echo 'PREPARE ENV'
               sh 'make pre-env'
           }
        }

        stage('Check 1') {
            steps {
               echo 'CHECK 1'
               sh 'make check'
            }
        }

        stage('Check 2') {
                    steps {
                       echo 'CHECK 2'
                       sh 'gem install bundle
                       sh 'bundle install --path vendor/bundle'
                       sh 'bundle exec danger'
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
