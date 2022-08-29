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
        // stage("Install Dependencies") {
        //     steps {
        //         sh "node -v"
        //         sh "npm ci"
        //     }
        // }

        stage('Initialize'){
            def dockerHome = tool 'mydocker'
            env.PATH = "${dockerHome}/bin:${env.PATH}"
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
    sh "sudo docker build -t local-test-next --build-arg ENV=QA ."
}