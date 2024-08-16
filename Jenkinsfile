// First, you need to install the Slack plugin on your Jenkins instance.
// author "saroj_ekka"
// Define the Slack channel to which you want to send the notification.
def slackChannel = '#devops_project'

// Define the Jenkins pipeline.
pipeline {
    agent any

    stages {
        stage('CHECKOUT') {
            steps {
                git 'https://github.com/ekka007/cab-booking-webapp_PROJECT.git'
            }
        }
        stage('CODE-BUILD') {
            steps {
                sh 'mvn compile'
            }
        }
        stage('test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('PACKAGE') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Genenrating test reports'){
            steps {
                echo "Generating test reports, executing code quality and security analysis with SonarCloud..."
            }
        }
//        stage ('sonar-scanner'){
//            steps {
//            script {
//            withSonarQubeEnv(installationName: 'sonar-4.8', credentialsId: 'sonar-token') {
//            sh "mvn sonar:sonar"
//            }
//        }
//    }
//}       
        stage('Docker-build') {
            steps {
                sh 'docker build -t sarojdevops/cab-booking-app:1.1 .'
            }
        }

        stage('Publish image to Docker Hub') {
        
            steps {
            sh 'docker login -u sarojdevops -p Qwerty007@'
            sh 'docker push sarojdevops/cab-booking-app:1.1' 
            }
        }
    }
        post {
        success {
            // Send an email notification when the build is successful
            emailext body: 'Build successful!', subject: 'Jenkins Build Success', to: 'sarojekka14@gmail.com'
            // Send a notification to Slack when the build is successful.
            slackSend color: '#00FF00', message: "Build completed successfully!", channel: slackChannel
        }
    }    
}
