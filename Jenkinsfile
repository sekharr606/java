pipeline {
    agent any

    environment {
        GIT_CREDENTIALS_ID = 'your-git-credentials-id'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://gitlab.com/iac2312807/task1.git', credentialsId: env.GIT_CREDENTIALS_ID
            }
        }

        stage('Build') {
            steps {
                // Insert your build steps here, e.g., running a build tool
                sh 'echo "Building the project..."'
            }
        }

        stage('Test') {
            steps {
      
