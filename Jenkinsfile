pipeline {
    agent any
    stages {
        stage ('git checkout') {
            steps {
                script {
                    git branch: 'master', url: 'https://github.com/vickydevo/mrvig_java_app.git'
                }
            }
        }
    }
}