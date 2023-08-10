pipeline {
    agent {
     label 'QatalystSlaveMachine'
    }
    options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    parameters {
        string(name: 'TAG', defaultValue: 'master', description: 'Tag / Branch name to be used for deployment')
        choice(name: 'STAGE', choices: ['dev', 'qa', 'staging', 'prod'], description: 'Select the stage')
    }
    environment{
        QATALYST_GOOGLE_CLIENT_ID_STAGE = "QATALYST_GOOGLE_CLIENT_ID_${params.STAGE.toUpperCase()}"
        QATALYST_GOOGLE_CLIENT_SECRET_STAGE = "QATALYST_GOOGLE_CLIENT_SECRET_${params.STAGE.toUpperCase()}"
        QATALYST_AMAZON_CLIENT_ID_STAGE = "QATALYST_AMAZON_CLIENT_ID_${params.STAGE.toUpperCase()}"
        QATALYST_AMAZON_CLIENT_SECRET_STAGE = "QATALYST_AMAZON_CLIENT_SECRET_${params.STAGE.toUpperCase()}"
        QATALYST_SENDGRID_KEY_STAGE = "QATALYST_SENDGRID_KEY_${params.STAGE.toUpperCase()}"
        QATALYST_AUTH0_CLIENT_ID_STAGE = "QATALYST_AUTH0_CLIENT_ID_${params.STAGE.toUpperCase()}"
        QATALYST_AUTH0_CLIENT_SECRET_STAGE = "QATALYST_AUTH0_CLIENT_SECRET_${params.STAGE.toUpperCase()}"
        QATALYST_100MS_ACCESS_KEY_STAGE = "QATALYST_100MS_ACCESS_KEY_${params.STAGE.toUpperCase()}"
        QATALYST_100MS_SECRET_KEY_STAGE = "QATALYST_100MS_SECRET_KEY_${params.STAGE.toUpperCase()}"
        PLATFORM_CLIENT_ID_IN_STAGE = "PLATFORM_CLIENT_ID_IN_${params.STAGE.toUpperCase()}"
        PLATFORM_CLIENT_ID_US_STAGE = "PLATFORM_CLIENT_ID_US_${params.STAGE.toUpperCase()}"  
        PLATFORM_CLIENT_ID_SEA_STAGE = "PLATFORM_CLIENT_ID_SEA_${params.STAGE.toUpperCase()}"
        PLATFORM_CLIENT_ID_EU_STAGE = "PLATFORM_CLIENT_ID_EU_${params.STAGE.toUpperCase()}"
        PLATFORM_SECRET_EU_STAGE = "PLATFORM_SECRET_EU_${params.STAGE.toUpperCase()}"
        PLATFORM_SECRET_IN_STAGE = "PLATFORM_SECRET_IN_${params.STAGE.toUpperCase()}"
        PLATFORM_SECRET_SEA_STAGE = "PLATFORM_SECRET_SEA_${params.STAGE.toUpperCase()}"
        PLATFORM_SECRET_US_STAGE = "PLATFORM_SECRET_US_${params.STAGE.toUpperCase()}"
        PLATFORM_REALM_ID_STAGE = "PLATFORM_REALM_ID_${params.STAGE.toUpperCase()}"
        
    }
    stages {
       stage('Print Job Name') {
            steps {
                script {
                    def jobName = env.JOB_NAME
                    echo "Jenkins job name: ${jobName}"
                }
            }
        }
        stage('Get Secret Values') {
            steps {
                echo "$QATALYST_GOOGLE_CLIENT_ID_STAGE"
                withCredentials([ 
                    string(credentialsId: "$QATALYST_GOOGLE_CLIENT_ID_STAGE", variable: 'QATALYST_GOOGLE_CLIENT_ID'),
                    string(credentialsId: "$QATALYST_GOOGLE_CLIENT_SECRET_STAGE", variable: 'QATALYST_GOOGLE_CLIENT_SECRET'),
                    string(credentialsId: "$QATALYST_AMAZON_CLIENT_ID_STAGE", variable: 'QATALYST_AMAZON_CLIENT_ID'),
                    string(credentialsId: "$QATALYST_AMAZON_CLIENT_SECRET_STAGE", variable: 'QATALYST_AMAZON_CLIENT_SECRET'),
                    string(credentialsId: 'SENTRY_DSN_QATALYST_BACKEND', variable: 'SENTRY_DSN_VALUE'),
                    string(credentialsId: 'QATALYST_BITLY', variable: 'QATALYST_BITLY'),
                    string(credentialsId: "$QATALYST_SENDGRID_KEY_STAGE", variable: 'QATALYST_SENDGRID_KEY'),
                    string(credentialsId: 'QATALYST_FIGMA_ACCESS_TOKEN', variable: 'QATALYST_FIGMA_ACCESS_TOKEN'),
                    string(credentialsId: 'DD_API_KEY', variable: 'DD_API_KEY'),
                    string(credentialsId: 'FINGERPRINT_API_TOKEN', variable: 'FINGERPRINT_API_TOKEN'),
                    string(credentialsId: "$QATALYST_AUTH0_CLIENT_SECRET_STAGE", variable: 'QATALYST_AUTH0_CLIENT_SECRET'),
                    string(credentialsId: "$QATALYST_AUTH0_CLIENT_ID_STAGE", variable: 'QATALYST_AUTH0_CLIENT_ID')
                    string(credentialsId: "$QATALYST_100MS_ACCESS_KEY_STAGE", variable: 'QATALYST_100MS_ACCESS_KEY'),
                    string(credentialsId: "$QATALYST_100MS_SECRET_KEY_STAGE", variable: 'QATALYST_100MS_SECRET_KEY'),
                    string(credentialsId: "$PLATFORM_CLIENT_ID_IN_STAGE", variable: 'PLATFORM_CLIENT_ID_IN'),
                    string(credentialsId: "$PLATFORM_CLIENT_ID_EU_STAGE", variable: 'PLATFORM_CLIENT_ID_EU'),
                    string(credentialsId: "$PLATFORM_CLIENT_ID_SEA_STAGE", variable: 'PLATFORM_CLIENT_ID_SEA'),
                    string(credentialsId: "$PLATFORM_CLIENT_ID_US_STAGE", variable: 'PLATFORM_CLIENT_ID_US'),
                    string(credentialsId: "$PLATFORM_SECRET_US_STAGE", variable: 'PLATFORM_SECRET_US'),
                    string(credentialsId: "$PLATFORM_SECRET_SEA_STAGE", variable: 'PLATFORM_SECRET_SEA'),
                    string(credentialsId: "$PLATFORM_SECRET_EU_STAGE", variable: 'PLATFORM_SECRET_EU'),
                    string(credentialsId: "$PLATFORM_SECRET_IN_STAGE", variable: 'PLATFORM_SECRET_IN'),
                    string(credentialsId: "$PLATFORM_REALM_ID_STAGE", variable: 'PLATFORM_REALM_ID')  
                ])
                {
                    sh '''
                     echo "$QATALYST_GOOGLE_CLIENT_ID"
                     chmod +x scripts -R  
                     if [[ $(echo $jobName | grep -i "infra-dev" ) ]]; then
                       stage="dev"
                     elif [[ $(echo $jobName | grep -i "infra-qa" ) ]]; then
                       stage="qa"
                     elif [[ $(echo $jobName | grep -i "infra-staging" ) ]]; then
                       stage="staging"
                     elif [[ $(echo $jobName | grep -i "infra-master" ) ]]; then
                       stage="master"
                     fi
                     echo "TAG value is : ${TAG}"
                     echo "STAGE value is : ${STAGE}"
                     ./scripts/deploy.sh $STAGE

                    '''
                }
            }
        }  
    }
}
