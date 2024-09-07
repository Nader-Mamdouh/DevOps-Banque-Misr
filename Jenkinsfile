pipeline {
    agent any
    stages {
        stage('Setup Python Virtual ENV for dependencies') {
            steps {
                bat '''
                chmod +x envsetup.bat
                call envsetup.bat
                '''
            }
        }
        stage('Setup Gunicorn') {
            steps {
                bat '''
                chmod +x gunicorn.bat
                call gunicorn.bat
                '''
            }
        }
        stage('Setup NGINX') {
            steps {
                bat '''
                chmod +x nginx.bat
                call nginx.bat
                '''
            }
        }
    }
}
