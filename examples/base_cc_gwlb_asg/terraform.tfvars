## This is only a sample terraform.tfvars file.
## Uncomment and change the below variables according to your specific environment

#####################################################################################################################
##### Variables 1-25 are populated automically if terraform is ran via ZSEC bash script.   ##### 
##### Modifying the variables in this file will override any inputs from ZSEC             #####
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
##    (Default: m5.large)

#ccvm_instance_type                         = "t3.medium"
#ccvm_instance_type                         = "m5.large"
#ccvm_instance_type                         = "c5.large"
#ccvm_instance_type                         = "c5a.large"
#ccvm_instance_type                         = "m5.2xlarge"
#ccvm_instance_type                         = "c5.2xlarge"
#ccvm_instance_type                         = "m5.4xlarge"
#ccvm_instance_type                         = "c5.4xlarge"

## 7. The number of Cloud Connector Subnets to create in sequential availability zones. Available input range 1-3 (Default: 2)
##    **** NOTE - This value will be ignored if byo_vpc / byo_subnets

#az_count                                   = 2

## 8. The minumum number of Cloud Connectors to maintain in an Autoscaling group. (Default: 2)
##    Recommendation is to maintain HA/Zonal resliency so for example if az_count = 2 and cross_zone_lb_enabled is false the minimum number of CCs you would want for a
##    production deployment would be 4

#min_size                                   = 2

## 9. The maximum number of Cloud Connectors to maintain in an Autoscaling group. (Default: 4)

#max_size                                   = 4

## 10. The amount of time until EC2 Auto Scaling performs the first health check on new instances after they are put into service. (Default: 900 seconds/15 minutes)

#health_check_grace_period                  = 900

## 11. IPv4 CIDR configured with VPC creation. Workload, Public, and Cloud Connector Subnets will be created based off this prefix
##    /24 subnets are created assuming this cidr is a /16. You may need to edit cidr_block values for subnet creations if
##    desired for smaller or larger subnets. (Default: "10.1.0.0/16")

#vpc_cidr                                   = "10.1.0.0/16"

## 12. Number of Workload VMs to be provisioned in the workload subnet. Only limitation is available IP space
##    in subnet configuration. Only applicable for "base" deployment types. Default workload subnet is /24 so 250 max

#workload_count                             = 2

## 13. Tag attribute "Owner" assigned to all resoure creation. (Default: "zscc-admin")

#owner_tag                                  = "username@company.com"

## 14. By default, Cloud Connectors are configured with a callhome IAM policy enabled. This is recommended for production deployments
##     The policy creation itself does not provide any authentication/authorization access. IAM details are still required to be provided
##     to Zscaler in order to establish a trust relationship. Uncomment if you do not want this policy created. (Default: true)

#cc_callhome_enabled                        = false

## 15. By default, GWLB deployments are configured as zonal. Uncomment if you want to enable cross-zone load balancing
##     functionality. Only applicable for gwlb deployment types. (Default: false)

#cross_zone_lb_enabled                      = true

## 16. If set to true, add a warm pool to the specified Auto Scaling group. See [warm_pool](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group#warm_pool).
##     Uncomment to enable. (Default: false)

#warm_pool_enabled                          = true

## 17. Sets the instance state to transition to after the lifecycle hooks finish. Valid values are: Stopped (default) or Running. Ignored when 'warm_pool_enabled' is false
##     Uncomment the desired value

#warm_pool_state                            = "Stopped"
#warm_pool_state                            = "Running"

## 18. Specifies the minimum number of instances to maintain in the warm pool. This helps you to ensure that there is always a certain number of warmed instances available to handle traffic spikes. Ignored when 'warm_pool_enabled' is false
##     Uncomment and specify a desired minimum number of Cloud Connectors to maintain deployed in a warm pool

#warm_pool_min_size                         = 1

## 19. Specifies the total maximum number of instances that are allowed to be in the warm pool or in any state except Terminated for the Auto Scaling group. Ignored when 'warm_pool_enabled' is false
##     Uncomment and specify a desired maximum number of Cloud Connectors to maintain deployed in a warm pool

#warm_pool_max_group_prepared_capacity      = 2

## 20. Specifies whether instances in the Auto Scaling group can be returned to the warm pool on scale in
##     Uncomment to enable. (Default: false)

#reuse_on_scale_in                          = true

## 21. Target value number for autoscaling policy CPU utilization target tracking. ie: trigger a scale in/out to keep average CPU Utliization percentage across all instances at/under this number
##     (Default: 20%)

#target_cpu_util_value                      = 20

## 22. Determine whether or not to create autoscaling group notifications. Default is false. If setting this value to true, terraform will also create a new sns topic and topic subscription in the same AWS account"

#sns_enabled                                = true

## 23. List of email addresses to input for sns topic subscriptions for autoscaling group notifications. Required if sns_enabled variable is true and byo_sns_topic false

#sns_email_list                             = ["john@corp.com","bob@corp.com"]

## 24. Determine whether or not to create an AWS SNS topic and topic subscription for email alerts. Setting this variable to true implies you should also set variable sns_enabled to true
##     Default: false

#byo_sns_topic                              = true

## 25. Existing SNS Topic friendly name to be used for autoscaling group notifications assignment

#byo_sns_topic_name                         = "topic-name"
