pipeline {
    agent any
    stages {
        stage('Setup Python Virtual ENV for dependencies') {
            steps {
                bat '''
                call envsetup.bat
                '''
            }
        }
        stage('Setup Gunicorn') {
            steps {
                bat '''
                call gunicorn.bat
                '''
            }
        }
        stage('Setup NGINX') {
            steps {
                bat '''
                call nginx.bat
                '''
            }
        }
    }
}
