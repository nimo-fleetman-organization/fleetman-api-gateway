pipeline {
   agent any

   environment {
     SERVICE_NAME = "fleetman-api-gateway"
     REPOSITORY_TAG="${DOCKERHUB_USERNAME}/${ORGANIZATION_NAME}-${SERVICE_NAME}:${BUILD_ID}"
   }

   stages {
      stage('Preparation') {
         steps {
			echo "aaaaaaaaaaaaaaaaaaaaa ${REPOSITORY_TAG}"		 
            cleanWs()
            git credentialsId: 'GitHub', url: "https://github.com/${ORGANIZATION_NAME}/${SERVICE_NAME}"
         }
      }
      stage('Build') {
		agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /home/jenkins/.m2:/root/.m2'
                }
            }
         steps {
            sh '''mvn clean package'''
         }
      }

      stage('Build and Push Image') {
         steps {		   
           sh 'docker image build -f Dockerfile -t ${REPOSITORY_TAG} .'
         }
      }

      stage('Deploy to Cluster') {
          steps {
                    sh 'envsubst < ${WORKSPACE}/deploy.yaml | kubectl apply -f -'
          }
      }
   }
}
