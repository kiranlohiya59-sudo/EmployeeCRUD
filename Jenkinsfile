

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo 'Code checked out successfully'
            }
        }

        stage('Maven Build') {
            steps {
                echo 'Building Spring Boot application'
                bat '"C:\\Users\\USER\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" run --rm -v "%CD%:/app" -w /app maven:3.9-eclipse-temurin-21 mvn package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image'
                bat '"C:\\Users\\USER\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" build --no-cache -t employeecrud:latest .'
            }
        }

        stage('Docker Check') {
            steps {
                echo 'Checking Docker image'
                bat '"C:\\Users\\USER\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" images employeecrud:latest'
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    bat '"C:\\Users\\USER\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" tag employeecrud:latest kiranlohiya59/employeecrud:latest'

                    withCredentials([usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )]) {
                        bat '''
                            powershell -NoProfile -NonInteractive -Command "$env:DOCKER_PASS | & 'C:\\Users\\USER\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe' login -u $env:DOCKER_USER --password-stdin"
                            if errorlevel 1 exit /b 1
                        '''
                    }

                    bat '"C:\\Users\\USER\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" push kiranlohiya59/employeecrud:latest'
                }
            }
        }

        stage('Success') {
            steps {
                echo 'Build completed successfully!'
                echo 'Docker image pushed to Docker Hub!'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution finished.'
        }
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Check the console output.'
        }
    }
}
