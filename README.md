# qatalyst-infra

About
This repo contains terraform script which will create resources used by qatalyst-infra for all the supported datacenter regions.
The following services running as a docker container on AWS ECS:
1) Dashboard
2) Tester-view
3) Reports
4) Prototype
5) Cyborg
6) Mammoth
7) furyblade

Pre Execution Steps
Configure the aws iam credentials of the respective aws account where you want to create resources in cli
Run terraform init command to perform sync with the existing backend terraform init

Executing Script
Execute the plan command to list all the changes that will be done when we execute the script terraform plan
Execute the apply command to create/update/delete resources in the cloud terraform apply