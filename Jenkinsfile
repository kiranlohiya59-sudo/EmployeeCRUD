
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code'
                checkout scm
            }
        }

        stage('Maven Build') {
            steps {
                echo 'Building Spring Boot application'
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Check') {
            steps {
                echo 'Checking Docker'
                bat '"C:\\Users\\USER\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" --version'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image'
                bat '"C:\\Users\\USER\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" build -t employeecrud:latest .'
            }
        }

        stage('Success') {
            steps {
                echo 'Build completed successfully!'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check Console Output.'
        }
        always {
            echo 'Pipeline execution finished.'
        }
    }
}