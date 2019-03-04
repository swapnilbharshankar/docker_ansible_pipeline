def pipelineContext = [:]
pipeline {
    agent any
    stages {
        stage ('Checkout Git') {
            steps {
                checkout scm
                stage ('Build Docker image') {
                    environment {
                        DOCKER_CREDENTIALS =credentials('docker_login')
                    }
                    steps {
                        echo 'Starting to build docker image'
                        script {
                            customImage = docker.build("${env.DOCKER_CREDENTIALS_USR}/my-image:${env.BUILD_ID}")
                        }
                    }
                }
            }
        }
    }
}