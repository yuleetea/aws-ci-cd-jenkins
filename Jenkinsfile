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
                    // Create and activate a virtual environment
                    sh 'python3 -m venv venv'
                    sh 'source venv/bin/activate'
                    // Install pytest
                    sh 'pip install pytest'
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
