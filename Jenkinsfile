pipeline {
        agent any

        stages {
              stage('Git Checkout'){
                 steps{
                    git 'https://github.com/narulsa1/django-app'
                 }
              }



              stage('Build Docker Image'){
                 steps{
                    sh "docker build -t djangoapp:${env.BUILD_NUMBER} ."
                 }
              }

              stage('Docker container') {
                 steps{
                    sh "docker-compose up -d"
                 }
              }

        }
}

