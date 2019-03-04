//def pipelineContext = [:]
pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS = credentials('docker_login')
    }
    stages {
        stage ('Checkout Git') {
            steps {
                checkout scm
            }
        }
    }
    stage ('Build Docker image') {
        steps {
            echo 'Starting to build docker image'
            script {
                customImage = docker.build("${env.DOCKER_CREDENTIALS_USR}/my-image:${env.BUILD_ID}")
            }
        }
    }
}
