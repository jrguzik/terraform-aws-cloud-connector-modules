## This is only a sample terraform.tfvars file.
## Uncomment and change the below variables according to your specific environment

#####################################################################################################################
##### Variables are populated automically if terraform is ran via ZSEC bash script.   ##### 
##### Modifying the variables in this file will override any inputs from ZSEC         #####
#####################################################################################################################

#####################################################################################################################
##### Cloud Init Userdata Provisioning variables  #####
#####################################################################################################################

## 1. Zscaler Cloud Connector Provisioning URL E.g. connector.zscaler.net/api/v1/provUrl?name=aws_prov_url

#cc_vm_prov_url                             = "connector.zscaler.net/api/v1/provUrl?name=aws_prov_url"

## 2. AWS Secrets Manager Secret Name from Secrets Manager E.g ZS/CC/credentials

#secret_name                                =  "ZS/CC/credentials/aws_cc_secret_name"

## 3. Cloud Connector cloud init provisioning listener port. This is required for GWLB and Health Probe deployments. 
## Uncomment and set custom probe port to a single value of 80 or any number between 1024-65535. Default is 50000.

#http_probe_port                            = 50000


#####################################################################################################################
##### Custom variables. Only change if required for your environment  #####
#####################################################################################################################

## 4. The name string for all Cloud Connector resources created by Terraform for Tag/Name attributes. (Default: zscc)

#name_prefix                                = "zscc"

## 5. AWS region where Cloud Connector resources will be deployed. This environment variable is automatically populated if running ZSEC script
##    and thus will override any value set here. Only uncomment and set this value if you are deploying terraform standalone. (Default: us-west-2)

#aws_region                                 = "us-west-2"

## 6. Cloud Connector AWS EC2 Instance size selection. Uncomment ccvm_instance_type line with desired vm size to change.
##    (Default: m6i.large)

#ccvm_instance_type                         = "t3.medium"
#ccvm_instance_type                         = "t3a.medium"
#ccvm_instance_type                         = "m5n.large"
#ccvm_instance_type                         = "c5a.large"
#ccvm_instance_type                         = "m6i.large"
#ccvm_instance_type                         = "c6i.large"
#ccvm_instance_type                         = "m5n.4xlarge"
#ccvm_instance_type                         = "c5.4xlarge"
#ccvm_instance_type                         = "m6i.4xlarge"
#ccvm_instance_type                         = "c6i.4xlarge"

## 7. Cloud Connector Instance size selection. Uncomment cc_instance_size line with desired vm size to change
##    (Default: "small") 
##    **** NOTE - There is a dependency between ccvm_instance_type and cc_instance_size selections ****
##    If size = "small" any supported EC2 instance type can be deployed, but "m6i/c6i.large" is ideal
##    If size = "medium" only 4xlarge and up EC2 instance types can be deployed
##    If size = "large" only 4xlarge EC2 instane types can be deployed 
##    **** NOTE - medium and large cc_instance_size is only supported with GWLB deployments. Legacy HA/Lambda deployments must be small.

#cc_instance_size                           = "small"
#cc_instance_size                           = "medium"
#cc_instance_size                           = "large" 

## 8. IPv4 CIDR configured with VPC creation. Workload, Public, and Cloud Connector Subnets will be created based off this prefix
##    /24 subnets are created assuming this cidr is a /16. You may need to edit cidr_block values for subnet creations if
##    desired for smaller or larger subnets. (Default: "10.1.0.0/16")

#vpc_cidr                                   = "10.1.0.0/16"

## 9. Number of Workload VMs to be provisioned in the workload subnet. Only limitation is available IP space
##    in subnet configuration. Only applicable for "base" deployment types. Default workload subnet is /24 so 250 max

#workload_count                             = 2

## 10. Tag attribute "Owner" assigned to all resoure creation. (Default: "zscc-admin")

#owner_tag                                  = "username@company.com"

## 11. SSH management access from the local VPC is enabled by default (true). Uncomment if you
##     want to disable this.
##     Note: Cloud Connector will only be accessible via AWS Session Manager SSM

#mgmt_ssh_enabled                           = false

## 12. By default, a security group is created and assigned to the CC service interface(s).
##     There is an optional rule that permits Cloud Connector to forward direct traffic out
##     on all ports and protocols. (Default: true). Uncomment if you want to restrict
##     traffic to only the ZIA/ZPA required HTTPS TCP/UDP ports.

#all_ports_egress_enabled                   = false

## 13. By default, this script will apply 1 Security Group per Cloud Connector instance. 
##     Uncomment if you want to use the same Security Group for ALL Cloud Connectors (true or false. Default: false)

#reuse_security_group                       = true

## 14. By default, this script will apply 1 IAM Role/Instance Profile per Cloud Connector instance. 
##     Uncomment if you want to use the same IAM Role/Instance Profile for ALL Cloud Connectors (true or false. Default: false)

#reuse_iam                                  = true

## 15. By default, terraform will always query the AWS Marketplace for the latest Cloud Connector AMI available.
##     This variable is provided if a customer desires to override or retain an old ami for existing deployments rather than upgrading and forcing a replacement. 
##     It is also inputted as a list to facilitate if a customer desired to manually upgrade only select CCs deployed based on the cc_count index

##     Note: Customers should NOT be hard coding AMI IDs as Zscaler recommendation is to always be deploying/running the latest version.
##           Leave this variable commented out unless you are absolutely certain why/that you need to set it and only temporarily.

#ami_id                                     = ["ami-123456789"]

## 16. By default, terraform will configure Cloud Connector with EBS encryption enabled.
##     Uncomment if you want to disable ebs encryption.

#ebs_encryption_enabled                     = false

## 17. By default, EBS encryptions is set to null which uses the AWS default managed/master key.
##     Set as 'alias/<key-alias>' to use an existing customer KMS key"

##     Note: this variable is only enforced if ebs_encryption_enabled is set to true

#byo_kms_key_alias                          = "alias/<customer key alias name>"
