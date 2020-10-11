#!groovy
String version

def featureEnv = env.BRANCH_NAME != 'master'
String appName = "simplespringboot"
String projectFile = "pom.xml"
String versionKey = "version"

String branchName = env.BRANCH_NAME
String env = env.BRANCH_NAME

pipeline {
    agent any
	
	tools {
		maven 'Maven 3.6.3'
		jdk 'jdk8'
	    }
    stages {
        stage ('Build') {
            steps {
               sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }
	    
	stage ('Code Analysis') {
            steps {
               sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }
	    
	stage ('Test Deploy') {
            steps {
               sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }
    }
}
