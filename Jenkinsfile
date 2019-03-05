def pipelineContext = [:]
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
        stage ('Build Docker image') {
            steps {
                echo 'Starting to build docker image'
                script {
//                    dockerImage = docker.build("${env.DOCKER_CREDENTIALS_USR}/my-image:${env.BUILD_ID}")
//                    pipelineContext.dockerImage = dockerImage 
                    try {
                        sh '''#!/bin/bash
                        docker build -t httpd:1 -f Dockerfile .

                        '''
                    }
                }
            }
        }
        stage('Run') {
            steps {
                echo "Run docker image"
                script {
                    pipelineContext.dockerContainer = pipelineContext.dockerImage.run()
                }
            }
        }
        stage('Verify') {
            parallel {
                stage('Verify home') {
                    steps {
                        echo "demo"
                        docker_id = sh (
                            script: 'docker images',
                            returnStdout: true
                        )
                        echo ${docker_id}
//                        sh "docker exec -it my-image:${env.BUILD_ID} /bin/bash -c "ps -ax""
                    }
                }
            }
        }
    }
}
