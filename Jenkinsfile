pipeline {
    agent { node { label 'AGENT-1' } }
    options {
        ansiColor('xterm')
    }
    parameters {
        string(name: 'version', defaultValue: '1.0.1', description: 'Which version to Deploy')
    }
    stages {
        stage('Deploy'){
            steps{
                echo "Deploying..."
                echo "Version from params: ${params.version}"

            }
        }
        stage('Init'){
            steps{
                sh """
                cd terraform
                terraform init -reconfigure
                """
            }
        }
        stage('Plan'){
            steps{
                sh """
                cd terraform
                terraform plan -var="app_version=1.0.3"
                """
            }
        }
        // stage('Apply'){
        //     steps{
        //         sh """
        //         cd terraform
        //         terraform apply -var="app_version=1.0.6" -auto-approve
        //         """
        //     }
        // }
    }


    post{
        always{
            echo 'cleaning up workspace'
            //deleteDir()
        }
    }
}