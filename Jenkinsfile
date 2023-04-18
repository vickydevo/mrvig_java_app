@Library('mr_jenkins_shared_lib') _

pipeline {
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'choose create/Destroy')
        string(name:'ImageName', description: "name of docker build", defaultValue:'javapp-vig')
        string(name:'ImageTag', description: "Tag of docker build", defaultValue:'ver1')
        string(name:'DockerhubUser', description: "name of Application", defaultValue:'vignan91')
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
                   mvnTest()

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

// but how u will fetch sonarqube credential id / AUTHENTICATION 
    // go pipeline syntax ----> steps ---> sample steps --->withSonarQubeEnv
    //  select sonarqube credential key   -----> generate pipeline script 

// withSonarQubeEnv(credentialsId: 'SONAR-API-VIG')

                    def SonarQubecredentialsId = 'SONAR-API-VIG'
                   statiCodeAnalysis(SonarQubecredentialsId)
                }
            }
        }

         stage ('Quality Gate status  check: sonarQube') {

         when { expression { params.action=='create'}  }  
            steps {
                script {

                // but how u will fetch sonarqube credential id / AUTHENTICATION 
    // go pipeline syntax ----> steps ---> sample steps --->waitForQualityGate
    //  select sonarqube credential key   -----> generate pipeline script 

                // waitForQualityGate abortPipeline: false, credentialsId: 'SONAR-API-VIG'
                    def SonarQubecredentialsId = 'SONAR-API-VIG'
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

                    dockerBuild("${params.ImageName}","${params.ImageTag}","${params.DockerhubUser}")
                }
            }
        }


        stage ('Docker scan image :trivy') {

         when { expression { params.action=='create'}  }  
            steps {
                script {

                    dockerImageScan("${params.ImageName}","${params.ImageTag}","${params.DockerhubUser}")
                }
            }
        }

         stage('Docker push image :DockerHub') {

         when { expression { params.action=='create'}  }  
            steps {
                script {

                    dockerImagePush("${params.ImageName}","${params.ImageTag}","${params.DockerhubUser}")
                }
            }
        }

        stage('DockerImageCleanUp :jenkins-server') {

         when { expression { params.action=='create'}  }  
            steps {
                script {

                    dockerImageCleanup("${params.ImageName}","${params.ImageTag}","${params.DockerhubUser}")
                }
            }
        }


    }

 }

