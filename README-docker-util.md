#Install Docker
https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04

#Install AWS CLI
sudo apt-get update.

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version.
aws configure

#Authenticate docker in AWS CLI
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 117249495680.dkr.ecr.us-east-1.amazonaws.com


#Tag and push image
docker tag swagger:latest 117249495680.dkr.ecr.us-east-1.amazonaws.com/swagger:latest

#Push Image to ECR
docker push 117249495680.dkr.ecr.us-east-1.amazonaws.com/swagger:latest

