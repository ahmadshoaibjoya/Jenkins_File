// => For using credentials in Jenkinsfile, you need to install "Credentials Bindung" Plugin

pipeline {

    // This build will be runned in any available Jenkins agent
    agent any

    // "tools "is used to define tools installations required for the pipeline job. 
    // It ensures that the necessary tools are available on the Jenkins agent where the pipeline runs.
    tools {
        // The name "my-Maven.3" come from the name configured in the Jenkins Global Tool Configuration.
        maven "my-Maven.3"
    }

    parameters {
        string(name: "ENVIRONMENT", defaultValue: "dev", description: "Environment to deploy to")
        booleanParam(name: "EXECUTE_TEST", defaultValue: true, description: "Do you want to test this Build?")
        choice(name: "TARGET_PLATFORM", choices: ["AWS","Azure","GCP"], description: "Target Platform for deployment")
    }

    // In "environment" we can define our enviroment variables and will be available in all stages.
    // The default Jenkins environment variables are in http://Your-Jenkins-URL/env-vars.html/
    environment {
        // MYCODE_CHANGES = getGitChanges()
        // MY_SERVER_CREDENTIALS = credentials("my-credential-id")
        NEW_VERSION = "1.3.0"
    }

    stages {

        stage("build"){
            // when {
            //     // In "expression" we can write Groovy expression
            //     expression {
            //         BRANCH_NAME == "main" && MYCODE_CHANGES == true
            //     }
            // }
            steps {
                echo "Building Version is ${NEW_VERSION}"
            }

        }

        stage("test"){

            when {
                
                expression {
                    params.EXECUTE_TEST == true
                }
            }
            steps {
                echo "Testing the Application"
            }

        }

        stage("deploy"){

            steps {
 
                echo "Deploying the Application."
                // withCredentials([
                //     usernamePassword(credentialsId: "my_test_credential", usernameVariable: "USERNAME", passwordVariable: "PASSWORD")
                // ]){
                //     sh 'echo "Username: $USERNAME"'
                //     sh 'echo "Password: $PASSWORD"'
                // }

                script {
                    echo "We doploy to ${params.ENVIRONMENT}"
                    echo "Testing the build: ${params.EXECUTE_TEST}"
                    echo "Our deploying target platform is: ${params.TARGET_PLATFORM}"
                }
                

                // sh "echo ${MY_SERVER_CREDENTIALS}"
            }

        }

    }


// "post" attribute is for executing some logics after all stages executed. it has three condations.
    post {

// "always" is a condition. Tt will be always executed whether the Build failed or successed.
        always {
            echo "Building Application finished."
        }
//  "success" is a condition. It will be executed when the Build successfully executed.
        success {
            echo "Application successfully builded!"
        }
// "failure" is condition. It will be executed when the Build unsuccessfully executed.
        failure {
            echo "The build process failed!"
        }

    }




}