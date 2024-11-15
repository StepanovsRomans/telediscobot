pipeline {
    agent any
    environment {
        REGISTRY_URL = 'registry-svc.registry.svc.cluster.local:5000'
        IMAGE_NAME = 'telediscobot'
        IMAGE_TAG = 'latest'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh """
                    docker build -t ${REGISTRY_URL}/${IMAGE_NAME}:${IMAGE_TAG} .
                    """
                }
            }
        }
        stage('Push to Local Docker Registry') {
            steps {
                script {
                    sh """
                    docker push ${REGISTRY_URL}/${IMAGE_NAME}:${IMAGE_TAG}
                    """
                }
            }
        }
    }
    post {
        success {
            echo 'Docker image built and pushed successfully!'
        }
        failure {
            echo 'Build or push process failed!'
        }
    }
}