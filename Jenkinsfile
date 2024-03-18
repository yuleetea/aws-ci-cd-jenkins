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

        // this stage DOES work but bc im using alpine (a lightweight image) i dont have access to service/systemctl which allows me to start docker.
        // next time i'll start the docker file with a more heavy image
        // stage('Build and Push Image') {
        //     steps {
        //         echo 'Building docker image and pushing to repository..'
        //         sh 'apk update'
        //         sh 'apk add docker'
        //         sh 'mkdir -p /etc/runlevels/default/'
        //         sh 'ln -s /etc/init.d/docker /etc/runlevels/default/docker'
        //         // Start Docker daemon and wait for it to initialize
        //         sh 'dockerd > /var/log/docker.log 2>&1 &'
        //         sh 'until docker info > /dev/null 2>&1; do echo "Waiting for Docker to start..."; sleep 5; done'
        //         // sh 'usermod -aG docker jenkins'
        //         // sh 'apt update'
        //         // sh 'apt install yum'
        //         // sh 'yum update'
        //         // sh 'yum install -y docker'
        //         // sh 'sudo usermod -a -G docker ec2-user'
        //         sh 'docker build -t python-flask:latest --load .'
        //         sh 'docker push yuleetea/python-flask:latest'
        //     }
        // }
        stage('SCM Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '4ba07c5d-7760-4491-90eb-fbcc242a6743', url: 'https://github.com/yuleetea/aws-ci-cd-jenkins.git']])
            }
        }
    }
}
