// **********************
//  "node" is nodejs puglin
// tested in mac machine
// **********************
pipeline {
    agent any

    tools { nodejs "mynode" }

    environment {
        FOO="FOO"
    }

    stages {
        stage("test"){
            steps {
                echo "test"
                script {
                    sh "npm -v"
                }
            }
        }
    }
}
