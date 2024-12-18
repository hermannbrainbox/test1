pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "my-app:latest" // Nom de l'image Docker
        REGISTRY = "localhost:5000"  // Optionnel : Registry si vous configurez un registry local
    }
    stages {
        stage('Checkout Code') {
            steps {
                echo "Cloning repository..."
                git branch: 'main', url: 'https://github.com/hermannbrainbox/test1.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image..."
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Push to Local Registry') {
            steps {
                script {
                    echo "Pushing Docker image to local registry..."
                    sh 'docker tag $DOCKER_IMAGE $REGISTRY/$DOCKER_IMAGE'
                    sh 'docker push $REGISTRY/$DOCKER_IMAGE'
                }
            }
        }
        stage('Deploy to Minikube') {
            steps {
                script {
                    echo "Deploying application to Minikube..."
                    sh '''
                    kubectl apply -f k8s/deployment.yaml
                    kubectl apply -f k8s/service.yaml
                    '''
                }
            }
        }
    }
    post {
        always {
            echo "Pipeline completed."
        }
    }
}
