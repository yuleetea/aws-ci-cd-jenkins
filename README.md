This is my personal project. Plans are to keep building off of it and add more functionality with an emphasis on CI/CD/DevOps practices and tools.
Behind this project I've also added bootstrap scripts/bash scripts to initialize my EC2 with docker,jenkins, and java.

Next steps is to experiment with Terraform and AWS SDK's to learn IaC. 
ASK:
Write an aws sdk stack with cloud formation OR terraform to build an ALB, EC2, ASG, and RDS server. It will need access to s3 for backups. Be able to pass in VPC, subnets, hostname, AMI as variables. It should accept https on the ALB with an SSL cert matching the hostname i pass in. USE the domain i bought as an example for this. It will be a domain hosted in route 53 in the same account. 
