pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        S3_BUCKET = 'jenkins-aws-demo-2026-yourname'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
                echo 'Code downloaded from GitHub'
            }
        }

        stage('Build') {
            steps {
                echo 'Building application...'
                sh 'ls -l'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing application...'
                sh 'test -f index.html'
                echo 'Test successful!'
            }
        }

        stage('Connect AWS') {
            steps {
                withAWS(
                    credentials: 'aws-jenkins-creds',
                    region: "${AWS_REGION}"
                ) {
                    script {
                        def identity = awsIdentity()
                        echo "Connected AWS Account: ${identity.account}"
                    }
                }
            }
        }

        stage('Deploy to S3') {
            steps {
                withAWS(
                    credentials: 'aws-jenkins-creds',
                    region: "${AWS_REGION}"
                ) {
                    s3Upload(
                        bucket: "${S3_BUCKET}",
                        file: 'index.html',
                        path: 'index.html'
                    )
                }
            }
        }
    }

    post {
        success {
            echo 'Application uploaded successfully to AWS S3!'
        }

        failure {
            echo 'Deployment failed. Check Console Output.'
        }
    }
}
