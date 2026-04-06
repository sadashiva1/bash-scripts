


pipeline {
    agent any

    stages {
        stage('Build & Push') {
            steps {
                withCredentials([usernamePassword( 
                    //injected as environment variables (env)
                    credentialsId: 'nexus-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh '''
                    git clone https://repo-url.git
                    cd repo
                    mvn clean package

                    curl -u $USER:$PASS \
                      -T target/app.jar \
                      http://nexus-url/repository/maven-releases/app.jar
                    '''
                }
            }
        }
    }
}

// Single-line shell (quick & dirty)
// sh 'git clone https://repo-url.git && cd repo && mvn clean package && curl -u user:pass -T target/app.jar http://nexus-url/repository/maven-releases/app.jar'

// Multi-line (BEST PRACTICE)
// sh '''
// git clone https://repo-url.git
// cd repo
// mvn clean package

// curl -u user:pass \
//   -T target/app.jar \
//   http://nexus-url/repository/maven-releases/app.jar
// '''


// Using Jenkins credentials (SECURE way)
// withCredentials([usernamePassword(
//     credentialsId: 'nexus-creds',
//     usernameVariable: 'USER',
//     passwordVariable: 'PASS'
// )]) {

//     sh '''
//     git clone https://repo-url.git
//     cd repo
//     mvn clean package

//     curl -u $USER:$PASS \
//       -T target/app.jar \
//       http://nexus-url/repository/maven-releases/app.jar
//     '''
// }

// JFrog (Artifactory) using CLI
// sh '''
// git clone https://repo-url.git
// cd repo
// mvn clean package
// jfrog rt u "target/*.jar" my-repo/
// '''



