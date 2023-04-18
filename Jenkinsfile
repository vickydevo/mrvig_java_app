@Library('mr_jenkins_shared_lib') _

pipeline {
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'choose create/Destroy')
        string(name:'ImageName', description: "name of docker build", defaultValue:'javapp-vig')
        string(name:'ImageTag', description: "Tag of docker build", defaultValue:'ver1')
        string(name:'APPname', description: "name of Application", defaultValue:'springboot-vig')
    }
    stages {
            
        stage ('git checkout') {
        when { expression { params.action=='create'}}
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

        when { expression { params.action=='create'}}
            steps {

            

                script {
                   mvnTest(
                    
                   )

                }
            }
        }


        stage ('Integration Test maven') {

        when { expression { params.action=='create'}  }  
            steps {

                 script {
                   mvnIntegrationTest()
                }
            }
        }


         stage ('static code analysis : sonarqube') {

         when { expression { params.action=='create'}  }  
            steps {
                script {

// but how u will fetch sonarqube credential id

                    def SonarQubecredentialsId = 'sonar-api-2'
                   statiCodeAnalysis(SonarQubecredentialsId)
                }
            }
        }

         stage ('Quality Gate status  check: sonarQube') {

         when { expression { params.action=='create'}  }  
            steps {
                script {

                    def SonarQubecredentialsId = 'sonar-api-2'
                   QualityGateStatus(SonarQubecredentialsId)
                }
            }
        }

        stage ('MAVEN BUILD') {

         when { expression { params.action=='create'}  }  
            steps {
                script {

                    mvnBuild()
                }
            }
        }

        stage ('Docker build image') {

         when { expression { params.action=='create'}  }  
            steps {
                script {

                    dockerBuild("${params.ImageName}","${params.ImageName}","${params.APPname}")
                }
            }
        }


    }

 }

