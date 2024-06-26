def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]
ProductName="abc"
ApplicationName="xyz"
TestApplicationName="uvw"
pipeline{
    agent any
    stages{
        stage("Git Checkout"){
            steps{
                echo 'cloning project'
                git branch: 'main', url: 'https://github.com/mroluyomiosh/mroluyomiosh-terra-gitops.git'
            }
        }
        stage("Verify Terraform Version"){
            steps{
                echo 'verifying the terraform version'
                sh 'terraform --version'
            }
        }
        stage("Terraform Init"){
            steps{
                echo 'Initializing the Terraform Project'
                sh 'terraform init'
            }
        }
        stage("Terraform Validate"){
            steps{
                echo 'validating the terraform configuration'
                sh 'terraform validate'
            }
        }
        stage("Terraform Plan"){
            steps{
                echo 'Terraform Plan For The Dry Run'
                sh 'terraform plan'
            }
        }
        stage("Checkov Scan"){
            steps{
                sh '''
                sudo pip3 install checkov
                checkov -d . --skip-check CKV_AWS_79,CKV_AWS_135
                '''
            }
        }
        stage("Manual Approval"){
            steps{
                input 'Approval required for deployment'
            }
        }
        stage("Terraform Apply"){
            steps{
                echo 'Setting up Infrastructure'
                sh 'sudo terraform apply -auto-approve'
            }
        }
    }
    post{
        always{
            echo 'Slack Notifications.'
            slackSend channel: '#general',
            color: COLOR_MAP[currentBuild.currentResult],
            message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    }
}
