pipeline {
    agent any
    environment {
        DIN="better0call/python-test-app"
        DOCKER_USER_NAME="better0call"
        DOCKER_AUTH_TOKEN=credentials('DOCKER_AUTH_TOKEN')

    }

    stages {
        stage('scm') {
            steps {
                echo "already taken care by Jenkins"
            }
        }

        stage('prepare env') {
            steps {
                // execute a shell command
                sh 'pip3 install -r req.txt '
            }
        }

        stage('test the application') {
            steps {
                sh 'pytest test_app.py'
            }
        }
        stage('docker build image') {
            steps {
                sh 'docker image build -t ${DIN} .'
            }
        }
        stage('docker login') {
            steps {
                sh 'echo ${DOCKER_AUTH_TOKEN} | docker login -u ${DOCKER_USER_NAME} --password-stdin'
            }
        }
        stage('push docker image') {
            steps {
                sh 'docker image push ${DIN}'
            }
        }
        stage('restart service') {
            steps {
                sh 'docker service update --force -image ${DIN} python-cpp'
            }
        }

        // stage('prepare the image') {
        // }
    }
}