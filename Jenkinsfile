pipeline {
    agent any

    stages {
        stage('Run from WSL') {
            steps {
                bat '''
wsl bash -lc "
cd /mnt/d/MEASTRO/new-workspace/kodak-Smile-with-OpenAI/ai-doctor && \
npm install && \
node index.mjs
"
'''
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

