pipeline {
    agent any

    environment {
        CI = "true"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/testing71794-cloud/kodak-Smile-with-OpenAI.git'
            }
        }

        stage('Check Environment') {
            steps {
                sh 'node -v'
                sh 'npm -v'
                sh 'adb devices'
                sh 'maestro --version || true'
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('ai-doctor') {
                    sh 'npm install'
                }
            }
        }

        stage('Run AI Doctor') {
            steps {
                dir('ai-doctor') {
                    sh 'node index.mjs'
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/*.log, **/artifacts/**, **/report.xml, **/screenshots/**', allowEmptyArchive: true
        }
        success {
            echo 'Pipeline executed successfully.'
        }
        failure {
            echo 'Pipeline failed. Please check logs and artifacts.'
        }
    }
}
