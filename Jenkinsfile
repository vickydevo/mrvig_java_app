@Library('jenkins_shard_libarary')
pipeline {
    agent any
    stages {
        stage ('git checkout') {
            steps {
                script {
                    gitCheckout(
                        branch: "master",
                        url: "https://github.com/vickydevo/mrvig_java_app.git"
                    )
                }
            }
        }
    }
}