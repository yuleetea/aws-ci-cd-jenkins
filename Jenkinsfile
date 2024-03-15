pipeline {
    agent any

    stages {
        stage('Init') {
            steps {
                echo 'Initializing..'
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                script {
                    // Install pytest using absolute path to pip
                    sh '/var/lib/jenkins/.local/bin/pip install pytest'
                    // Run pytest
                    sh 'pytest'
                }
            }
        }
        stage('SCM Checkout') {
            steps {
                echo "SCM Checkout"
            }
        }
    }
}
