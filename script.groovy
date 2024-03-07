def buildApp(){
    echo "Building... this message come from Groovy script"

    // All environmental variables and parameters in Jenkinsfile are also available in Groovy scripts.
    echo "Building Version is ${NEW_VERSION}. It comes from Groovy script"
}

def testApp(){
    echo "Testing... this message come from Groovy script"
}

def deployApp(){
    echo "Deploying... this message come from Groovy script"
}


return this