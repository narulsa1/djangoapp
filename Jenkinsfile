pipeline {
        agent any

        stages {
              stage('Git Checkout'){
                 steps{
                    git 'https://github.com/narulsa1/djangoapp'
                 }
              }



              stage('Build Docker Image'){
                 steps{
                    sh "docker build -t djangoapp:${env.BUILD_NUMBER} ."
                 }
              }

              stage('Docker Hub Push'){
                 steps{
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pswd', usernameVariable: 'username')]) {
                       sh "docker login -u ${username} -p ${pswd}"
                       sh "docker push djangoapp:${env.BUILD_NUMBER}"
                    }      
                 }
              }

              stage('Docker container') {
                 steps{
                 sh "docker run -itd -p 8000:8000 -e  DJANGO_SUPERUSER_USERNAME=admin -e DJANGO_SUPERUSER_PASSWORD=sekret1 -e DJANGO_SUPERUSER_EMAIL=admin@example.com djangoapp:${env.BUILD_NUMBER}"
                 }
              }

        }
}

