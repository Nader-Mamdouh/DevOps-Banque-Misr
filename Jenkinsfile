pipeline {
    agent any
    environment {
        VIRTUAL_ENV = 'venv'
        PIP_REQUIREMENTS = 'requirements.txt'
    }
    stages {
        stage('Checkout SCM') {
            steps {
                // Checkout the code from the Git repository
                checkout scm
            }
        }
        
        stage('Setup Python Virtual ENV for dependencies') {
            steps {
                script {
                    // Check if Python is available and create virtual environment
                    if (isUnix()) {
                        sh """
                        python3 -m venv ${VIRTUAL_ENV}
                        source ${VIRTUAL_ENV}/bin/activate
                        pip install -r ${PIP_REQUIREMENTS}
                        """
                    } else {
                        bat """
                        python3 -m venv ${VIRTUAL_ENV}
                        venv\\Scripts\\activate
                        pip install -r ${PIP_REQUIREMENTS}
                        """
                    }
                }
            }
        }

        stage('Run Django Server') {
            steps {
                script {
                    // Activate the virtual environment and run the Django server
                    if (isUnix()) {
                        sh """
                        source ${VIRTUAL_ENV}/bin/activate
                        python manage.py runserver
                        """
                    } else {
                        bat """
                        venv\\Scripts\\activate
                        python manage.py runserver
                        """
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up after the build
            echo 'Cleaning up workspace'
            cleanWs()
        }
    }
}
