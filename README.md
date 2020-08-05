
#Please follow below steps to create AWS instance using terraform
1) clone code repo using "git clone url"
2) In order to use terraform scripts we should have terraform installed
3) Once terraform installed, go to cloned directory and run terraform init to initialize
4) Once terraform init completed, run terraform plan for checking
5) Once terraform plan completed succcessfully, run terraform apply to create instance with specified rules in ec2.tf
6) Now you can see created ec2 instance in AWS console and also security group associated with it

#Please follow below steps to configure created EC2 instance with required apache configuration
1) go to clonned directory
2) run ansible playbook which will invoke apache roles using below command
ansible-playbook -i "publicip," --user ec2-user --key-file /path/to/filename.pem --extra-vars '{"publicip":"$publicip"}
3)  In the above command replace public ip with public ip created under /tmp/publicip and filename.pem file with pem file which created when we ran terraform scripts

