// **********************
//  "node" is nodejs puglin
// tested in mac machine
// **********************
pipeline {
    agent any

    tools { nodejs "node" }

    environment {
        FOO="FOO"
    }

    stages {
        stage('NPM: config') {
            steps {
                script {
                    def token = "YXJpZWwuYWxlam86ZkpMNmVWZjRxZHR1Ul9BNQ=="
                    sh "echo '//ae-qa-nexus-app01:8081/content/groups/npm-all/:_auth=${token}' >> .npmrc"
                    sh "cat .npmrc"
                }
            }
        }

        stage("Install Dependencies") {
            steps {
                sh "node -v"
                sh "npm ci"
            }
        }

        stage('Initialize'){
            steps{
                script{
                    def dockerHome = tool 'mydocker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                }
            }
        }


        stage('deploy') {
            steps {
                script{
                    echo "hello jenkins"
                    buildDocker()
                }
            }
        }
    }
}

def buildDocker() {
    sh "docker build -t local-test-next --build-arg ENV=QA ."
}