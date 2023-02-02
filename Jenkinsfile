pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker')
    }
    stages {
        stage('Build docker image') {
            steps {
                sh 'docker build -t hemanth1337/newcalc .'
            }   
        }
        stage('login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push  hemanth1337/newcalc'
            }
        }
        stage('Remove existing container'){
            steps {
                sh 'docker container rm -f tim'

            }
        }
        stage('Run container') {
            steps {
                sh 'docker container run -dt --name tim -p 49152:8080  hemanth1337/newcalc'
                sh 'docker container ls'
            }
        }
    
    }
    
}

