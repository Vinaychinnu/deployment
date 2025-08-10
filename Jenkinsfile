pipeline{
    agent any
    stages{
        stage("code"){
            steps{
                git 'https://github.com/Vinaychinnu/deployment.git'
            }
        }
        stage("Building the Image"){
            steps{
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage("running the image"){
            steps{
                sh 'docker run -itd --name $CONTAINER_NAME -p 8081:80 $IMAGE_NAME'
            }
        }
    }
    
    post {
        success{
            echo "puzzle deployed successfully"
        }
        failure{
            echo "pipeline failed, check logs for more details"
        }
    }
}
