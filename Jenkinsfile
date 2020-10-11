#!groovy
String version

def featureEnv = env.BRANCH_NAME != 'master'
String appName = "eqx_api-api-account"
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
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Test Deploy') {
	when {
                anyOf { branch 'develop'; }
            }			      
            steps {
                echo 'Deploying....'
            }
        }
	stage('Stag Deploy') {
	when {
		anyOf { branch 'release'; }
            }
            steps {
                echo 'Deploying....'
            }
        }
	stage('Prod Deploy') {
	when {
                anyOf { branch 'master'; }
            }
            steps {
                echo 'Deploying....'
            }
        }
    }
}
