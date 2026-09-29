
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code'
                checkout scm
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Spring Boot application inside Docker'
                bat '"C:\\Users\\USER\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" build --no-cache -t employeecrud:latest .'
            }
        }

        stage('Docker Check') {
            steps {
                echo 'Checking Docker image'
                bat '"C:\\Users\\USER\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" images employeecrud:latest'
            }
        }

        stage('Success') {
            steps {
                echo 'Docker image built successfully!'
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