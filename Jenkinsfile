pipeline {
    // you can run docker container that already has pytest installed
    agent {
        docker {
            image 'python:3.8' // Choose an image with pytest installed
            args '-u root' // Run container as root to install packages
        }
    }

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
                sh 'pip install pytest'
                sh 'pytest'
            }
        }
        stage('SCM Checkout') {
            steps {
                echo "SCM Checkout"
            }
        }
    }
}
