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
		    maven('clean build', projectFile)
		    maven {
			    goals('clean')
			    goals('build')
		    }
	    }
        }
    }
}
