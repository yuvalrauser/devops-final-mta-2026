// Jenkinsfile — declarative pipeline for MeTA BMI Calculator
// Deploys the JSP app from this repo into the local Tomcat 8.5 webapps folder.
//
// Triggers:
//   - SCM polling every minute (so a `git push` causes a deploy within ~60s).
//
// Assumptions:
//   - Jenkins agent runs on Windows.
//   - The user that started Jenkins (java -jar jenkins.war) has WRITE access
//     to "C:\Program Files\Apache Software Foundation\Tomcat 8.5\webapps\MeTA-final".
//     If you haven't yet, run scripts\grant-tomcat-write.ps1 (one-time, admin).
//   - Tomcat is listening on http://localhost:8080.

pipeline {
    agent any

    options {
        timestamps()
        timeout(time: 5, unit: 'MINUTES')
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '20'))
    }

    triggers {
        pollSCM('* * * * *')   // poll GitHub every minute
    }

    environment {
        TOMCAT_WEBAPPS = 'C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps'
        APP_NAME       = 'MeTA-final'
        APP_URL        = 'http://localhost:8080/MeTA-final/'
    }

    stages {

        stage('Checkout') {
            steps {
                echo "Checking out from SCM..."
                checkout scm
                bat 'git log -1 --pretty=format:"Last commit: %%H %%s (by %%an)"'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                echo "Copying JSP files into ${TOMCAT_WEBAPPS}\\${APP_NAME}"
                bat """
                  @echo on
                  if not exist "%TOMCAT_WEBAPPS%\\%APP_NAME%" mkdir "%TOMCAT_WEBAPPS%\\%APP_NAME%"
                  xcopy /Y /Q "*.jsp" "%TOMCAT_WEBAPPS%\\%APP_NAME%\\"
                """
            }
        }

        stage('Verify deployment') {
            steps {
                echo "Pinging ${APP_URL} to confirm Tomcat picked up the new files..."
                bat """
                  @echo on
                  curl --silent --show-error --fail --max-time 10 -o NUL -w "HTTP %%{http_code} in %%{time_total}s\\n" "%APP_URL%"
                """
            }
        }
    }

    post {
        success {
            echo "Deploy OK — open ${APP_URL}"
        }
        failure {
            echo "Deploy FAILED — check console output above."
        }
    }
}
