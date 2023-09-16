pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'musicman123/music_man_docker_repo'       

        DOCKER_IMAGE_TAG = 'simple-app-back'

        EC2_SERVER = '3.123.59.126' 

        DOCKERHUB_USERNAME = credentials('dockerhub_username')      
        
        DOCKERHUB_PASS = credentials('dockerhub_pass')

        DB_HOST = credentials('db_host')

        PORT = '4000'
    }
    

    stages {
        // stage('Test') {
        //     agent {
        //         docker {
        //             image 'node'                   
        //             reuseNode true
        //         }
        //     }
        //     steps {
        //         sh 'apt-get update'
        //         sh 'npm install'
        //         sh 'npm run lint:js'
        //     }
        // }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build . -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} --build-arg PORT=${PORT} --build-arg DB_HOST=${DB_HOST}"
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASS}"

                    sh "docker push ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent(['SSH-AWS-EC2-Access']) {
                    sh "ssh -o StrictHostKeyChecking=no ubuntu@${EC2_SERVER} 'docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASS} && docker pull ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} && cd /home/ubuntu/simple-app && docker-compose up -d'"
                }                
            }
        }                 
    } 
}
