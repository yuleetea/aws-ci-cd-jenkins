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
                sh pytest
            }
        }
        stage('SCM Checkout') {
            steps {
                echo "SCM Checkout"
            }
        }

    }
}
