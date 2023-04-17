@Library('jenkins-shard-library') _

pipeline {
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'choose create/Destroy')
    }
    stages {
            
        stage ('git checkout') {
        when { expression { param.action=='create'}}
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

        when { expression { param.action=='create'}}
            steps {

            

                script {
                   mvnTest(
                    
                   )

                }
            }
        }


        stage ('Integration Test maven') {

        when { expression { param.action=='create'}  }  
            steps {

                 script {
                   mvnIntegrationTest()
                }
            }
        }


         stage ('static code analysis : sonarqube') {

         when { expression { param.action=='create'}  }  
            steps {
                script {
                   statiCodeAnalysis()
                }
            }
        }



    }

 }

