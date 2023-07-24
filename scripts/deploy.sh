#!/usr/bin/env bash
echo $GIT_URL
echo $GIT_COMMIT
API_SECRET_KEY=${API_SECRET_KEY}
stage=${1}

set -x

aws_stage=$(echo "$stage" | tr  '[:lower:]' '[:upper:]') 
echo $aws_stage
export AWS_PROFILE="ENTROPIKTECH_$aws_stage"
export AWS_DEFAULT_REGION="ap-southeast-1"

if [[ $stage == "qa" ]]
then 
    sed -i "s/dev/$stage/g" terraform_backend.tf
elif [[ $stage == "staging" ]]
then 
    sed -i "s/dev/$stage/g" terraform_backend.tf
elif [[ $stage == "prod" ]]
then 
    sed -i "s/dev/$stage/g" terraform_backend.tf
fi

# Google SSO
sed -i "s/#QATALYST_GOOGLE_CLIENT_ID/$QATALYST_GOOGLE_CLIENT_ID/g" modules/cognito/main.tf
sed -i "s/#QATALYST_GOOGLE_CLIENT_SECRET/$QATALYST_GOOGLE_CLIENT_SECRET/g" modules/cognito/main.tf
sed -i "s/#QATALYST_AMAZON_CLIENT_ID/$QATALYST_AMAZON_CLIENT_ID/g" modules/cognito/main.tf
sed -i "s/#QATALYST_AMAZON_CLIENT_SECRET/$QATALYST_AMAZON_CLIENT_SECRET/g" modules/cognito/main.tf
sed -i "s/#QATALYST_AUTH0_CLIENT_ID/$QATALYST_AUTH0_CLIENT_ID/g" modules/cognito/main.tf
sed -i "s/#QATALYST_AUTH0_CLIENT_SECRET/$QATALYST_AUTH0_CLIENT_SECRET/g" modules/cognito/main.tf


#SENTRY_DSN_VALUE
sed -i "s/#SENTRY_DSN_VALUE/$SENTRY_DSN_VALUE/g" modules/ssm/main.tf

#SSM VALUE#
sed -i "s/#BITLY_BEARER_TOKEN/$QATALYST_BITLY/g" modules/ssm/main.tf
sed -i "s/#SENDGRID_KEY/$QATALYST_SENDGRID_KEY/g" modules/ssm/main.tf
sed -i "s/#FIGMA_ACCESS_TOKEN/$QATALYST_FIGMA_ACCESS_TOKEN/g" modules/ssm/main.tf
sed -i "s/#DD_API_KEY/$DD_API_KEY/g" modules/ssm/main.tf
sed -i "s/#FINGERPRINT_API_TOKEN/$FINGERPRINT_API_TOKEN/g" modules/ssm/main.tf
sed -i "s/#QATALYST_100MS_ACCESS_KEY/$QATALYST_100MS_ACCESS_KEY/g" modules/ssm/main.tf

terraform init
terraform validate
terraform workspace list
terraform workspace select qatalyst-${stage}
terraform plan -var-file=tfvars/${stage}.tfvars
terraform apply -var-file=tfvars/${stage}.tfvars -auto-approve 
