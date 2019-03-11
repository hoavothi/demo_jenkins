pipeline {
    agent any
    stages {
        stage('Check') {
            steps {
                sh 'env'
                sh 'rm -f env.list'
                sh 'env | grep "GIT\\|NODE_\\|STAGE\\|BUILD\\|JOB_NAME\\|ghprbPullId\\|CHANGE_ID" > env.list'
                sh 'cat env.list'
                sh 'make check'
            }
        }
     }

    post {
        always {
//            echo 'Report unit test to jenkins!!!'
//            junit '**/test-results/**/*.xml'

            echo 'Archive artifact'
            archiveArtifacts artifacts: 'app/build/reports/**'

            echo 'Delete Workspace.'
            sh 'sudo chown -R jenkins.jenkins .'
            sh 'chmod -R +w .'
            sh 'ls -la'
            deleteDir()

        }
        success {
            echo 'build is success!!!'
        }
        failure {
            echo 'build is failure!!!'
            // TODO something
        }
    }
}
