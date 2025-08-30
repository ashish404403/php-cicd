pipeline {
    agent { 
        node {
            label 'my-agent-01'
            }
      }
    triggers {
        pollSCM '* * * * *'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    echo "Building Docker image..."
                    sh "docker build -t ashish403/php-cicd:latest-jenkinsfile ."
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo "Running tests inside container..."
                    sh "docker run --rm ashish403/php-cicd:latest-jenkinsfile echo 'Running tests...'"
                }
            }
        }

        stage('Deliver') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'ashish403', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        echo "Logging in to Docker Hub..."
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                        echo "Pushing image to Docker Hub..."
                        sh "docker push ashish403/php-cicd:latest-jenkinsfile"
                    }
                }
            }
        }
    }
}
