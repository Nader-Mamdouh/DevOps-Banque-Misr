pipeline {
    agent any
    
    stages {
        stage('Setup Python Virtual ENV for dependencies') {
            steps {
                bat '''
                python -m venv venv
                venv\\Scripts\\activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Django Server') {
            steps {
                bat '''
                start /B python manage.py runserver 0.0.0.0:8000
                '''
            }
        }
    }
}
