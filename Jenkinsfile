pipeline {
    agent any

    stages {

        stage('Run AI Doctor') {
            steps {
                bat '''
                cd D:\\MEASTRO\\new-workspace\\kodak-Smile-with-OpenAI\\ai-doctor
                npm install
                node index.mjs
                '''
            }
        }

    }

    post {
        always {
            archiveArtifacts artifacts: '**/artifacts/**', allowEmptyArchive: true
        }

        success {
            echo 'Pipeline executed successfully.'
        }

        failure {
            echo 'Pipeline failed. Please check logs and artifacts.'
        }
    }
}
