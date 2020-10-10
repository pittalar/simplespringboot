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

    stages {
        stage('Build') {
            agent any
            tools {
                maven 'maven-3.5.0'
            }
            steps {
                script {
                    version = featureEnv ?
                            VersionNumber(versionNumberString:'${BUILD_YEAR}.${BUILD_MONTH}.${BUILD_DAY}.${BUILDS_TODAY}', skipFailedBuilds:false) :
                            VersionNumber(versionNumberString: '1.0.${BUILD_NUMBER, X}', skipFailedBuilds:false)
                    currentBuild.displayName = version
                    println "Pipeline Version='${version}'"
                }
                dir("${WORKSPACE}") {
                    sh("""
                        # Set version based on build number
                        find . -type f -name pom.xml | xargs sed -i 's/0.0.0/'${version}'/g'
                    """)
                    mavenBuild(version, appName, env, projectFile)
                }
            }
        }

        stage('Code Analytics') {
            agent any
            tools {
                maven 'maven-3.5.0'
            }
            environment{
                 SONAR_SCANNER_OPTS="-Xmx512m"
            }
            steps {
                dir("${WORKSPACE}") {
                    unstash name: "${appName}-build-output-${env}"
                    withSonarQubeEnv('Sonarqube') {
                        mavenTest(projectFile, branchName)
                    }
                }

            }
        }


        stage('Artifact Build') {
            when {
                anyOf { branch 'develop'; branch 'master'; branch 'release' }
            }
			agent any()
            steps{
                script {
                   dockerBuildArgs = ['version':"${version}"]
                }           
            }
        }
    }
}
