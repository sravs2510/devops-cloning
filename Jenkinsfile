pipeline {
    agent {
     label 'QatalystSlaveMachine'
    }
    options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    parameters {
        string(name: 'TAG', defaultValue: 'master', description: 'Tag / Branch name to be used for deployment', trim: true)
        choice choices: ['dev', 'qa', 'staging', 'prod'], name: 'STAGE'
    }
    environment{
        QATALYST_GOOGLE_CLIENT_ID_STAGE = "QATALYST_GOOGLE_CLIENT_ID_${params.STAGE.toUpperCase()}"
        QATALYST_GOOGLE_CLIENT_SECRET_STAGE = "QATALYST_GOOGLE_CLIENT_SECRET_${params.STAGE.toUpperCase()}"
    }
    stages {
        stage('Get Secret Values') {
            steps {
                echo "$QATALYST_GOOGLE_CLIENT_ID_STAGE"
                withCredentials([ 
                    string(credentialsId: "$QATALYST_GOOGLE_CLIENT_ID_STAGE", variable: 'QATALYST_GOOGLE_CLIENT_ID'),
                    string(credentialsId: "$QATALYST_GOOGLE_CLIENT_SECRET_STAGE", variable: 'QATALYST_GOOGLE_CLIENT_SECRET'),
                    string(credentialsId: 'SENTRY_DSN_QATALYST_BACKEND', variable: 'SENTRY_DSN_VALUE'),
                    string(credentialsId: 'QATALYST_BITLY', variable: 'QATALYST_BITLY'),
                    string(credentialsId: 'QATALYST_SENDGRID_KEY', variable: 'QATALYST_SENDGRID_KEY'),
                    string(credentialsId: 'QATALYST_FIGMA_ACCESS_TOKEN', variable: 'QATALYST_FIGMA_ACCESS_TOKEN'),
                    string(credentialsId: 'DD_API_KEY', variable: 'DD_API_KEY'),
                    string(credentialsId: 'FINGERPRINT_API_TOKEN', variable: 'FINGERPRINT_API_TOKEN')
                ])
                {
                    sh '''
                     echo "$QATALYST_GOOGLE_CLIENT_ID"
                     chmod +x scripts -R
                     ./scripts/deploy.sh $STAGE

                   '''
                }
            }
        }  
    }
}
