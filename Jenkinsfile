pipeline {
    // you can run docker container that already has pytest installed
    agent {
        docker {
            image 'yuleetea/python-flask:latest' // take my image
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
                // sh 'pip install pytest'
                sh 'pip install -r requirements.txt'  // Install dependencies from requirements.txt
                sh 'pytest'
            }
        }
        stage('Build and Push Image') {
            steps {
                echo 'Building docker image and pushing to repository..'
                sh 'curl -fsSL https://get.docker.com | sh'
                sh 'docker build -t python-flask:latest --load .'
                sh 'docker push yuleetea/python-flask:latest'
            }
        }
        stage('SCM Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '4ba07c5d-7760-4491-90eb-fbcc242a6743', url: 'https://github.com/yuleetea/aws-ci-cd-jenkins.git']])
            }
        }
    }
}
