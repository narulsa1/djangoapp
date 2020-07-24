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
                       sh "docker tag djangoapp:${env.BUILD_NUMBER} snarula/djangoapp:${env.BUILD_NUMBER}"
                       
                    }      
                 }
              }

              stage('Ansible Run') {
                 steps{
                         sh "ansible-playbook /root/ansible/deployapp.yaml --extra-vars "BUILD_NUMBER={{ ${env.BUILD_NUMBER}} }""
                 }
              }

        }
}

