pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-2' 
        APPLICATION_NAME = 'albin-app' 
        DEPLOYMENT_GROUP = 'albin-dg'
        S3_BUCKET = 'albin-codedeploy-bucket-2026' 
              
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main',
                url: 'https://github.com/albin-shaji/aws-CI-CD-pipeline-demo.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Create Deployment Package') {
            steps {
                sh '''
                zip -r deployment.zip . \
                -x "*.git*" \
                -x "node_modules/*" \
		-x "app.log"
                '''
            }
        }

        stage('Upload to S3') {
            steps {
                withAWS(credentials: 'aws-jenkins-creds',
                         region: 'ap-south-2') {

                    sh '''
                    aws s3 cp deployment.zip \
                    s3://$S3_BUCKET/deployment.zip
                    '''
                }
            }
        }

        stage('Deploy to CodeDeploy') {
            steps {
                withAWS(credentials: 'aws',
                         region: 'ap-south-2') {

                    sh '''
                    aws deploy create-deployment \
                    --application-name $APPLICATION_NAME \
                    --deployment-group-name $DEPLOYMENT_GROUP \
                    --s3-location bucket=$S3_BUCKET,bundleType=zip,key=deployment.zip
                    '''
                }
            }
        }
    }
}
