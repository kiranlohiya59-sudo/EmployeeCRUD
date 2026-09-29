pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo 'Code downloaded'
            }
        }

        stage('Build') {
            steps {
                bat 'mvnw.cmd clean package -DskipTests'
            }
        }
stage('Docker Build') {
    steps {
        bat 'docker build -t employeecrud:latest .'
    }
}
        stage('Success') {
            steps {
                echo 'Build completed successfully!'
            }
        }
    }
}