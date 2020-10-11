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

    stages {
        stage('Build') {
            agent any
            tools {
                maven 'Maven 3.6.3'
            }
            steps {
		    maven {
			    goals('clean')
			    goals('build')
		    }
        }

        stage('Code Analytics') {
            agent any
            tools {
                maven 'Maven 3.6.3'
            }
            environment{
                 SONAR_SCANNER_OPTS="-Xmx512m"
            }
            steps {
                dir("${WORKSPACE}") {
                    unstash name: "${appName}-build-output-${env}"
                    withSonarQubeEnv('Sonarqube') {
                        maven {
			    goals('test')
			}
                    }
                }

            }
        }


        stage('Artifact Build') {
            when {
                anyOf { branch 'develop'; branch 'master'; branch 'release' }
            }
	    agent any
            steps{
                script {
                   dockerBuildArgs = ['version':"${version}"]
                }           
            }
        }
    }
}
