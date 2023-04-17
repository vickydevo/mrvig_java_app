@Library('jenkins-shard-library') _

pipeline {
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'choose create\Destroy')
    }
    stages {
            when { expression { param.action=='create'}}
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

            when { expression { param.action=='create'}}

                script {
                   mvnTest(
                    
                   )

                }
            }
        }


        stage ('Integration Test maven') {
            steps {

            when { expression { param.action=='create'}  }  

                script {
                   mvnIntegrationTest()
                }
            }
        }


         stage ('static code analysis : sonarqube') {
            steps {

            when { expression { param.action=='create'}  }  

                script {
                   statiCodeAnalysis()
                }
            }
        }

        
    }

 }

