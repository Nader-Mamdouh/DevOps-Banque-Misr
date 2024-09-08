pipeline {
    agent any
    stages {
        stage('Setup Python Virtual ENV for dependencies') {
            steps {
                sh 'python -m venv venv'
                sh 'venv\\Scripts\\activate'
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run Django Server') {
            steps {
                bat 'start /B python manage.py runserver'
            }
        }
    }
}
