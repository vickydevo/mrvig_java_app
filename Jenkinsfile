@Library('jenkins-shard-library') _

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

        stage ('Unit Test maven') {
            steps {
                script {
                   mvnTest(
                    
                   )

                }
            }
        }
        stage ('Integration Test maven') {
            steps {
                script {
                   mvnIntefrationTest()
                }
            }
        }

    }
}