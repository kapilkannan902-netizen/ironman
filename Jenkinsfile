pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
                echo 'GitHub code downloaded successfully'
            }
        }

        stage('Build') {
            steps {
                echo 'Build started'
                sh 'ls -la'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    if [ ! -f index.html ]; then
                        echo "ERROR: index.html not found!"
                        exit 1
                    fi

                    cp index.html /var/www/html/index.html

                    echo "Deployment completed successfully!"
                '''
            }
        }

        stage('Verify') {
            steps {
                sh 'curl -I http://localhost'
            }
        }
    }
}
