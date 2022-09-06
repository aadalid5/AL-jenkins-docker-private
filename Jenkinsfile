// **********************
//  "node" is nodejs puglin
// tested in mac machine
// **********************
pipeline {
    agent any

    tools { nodejs "18.8.0" }

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
