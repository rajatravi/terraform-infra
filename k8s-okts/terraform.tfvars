#Global Vars
AWS_SSH_KEY_NAME   = "okts-key"
AWS_DEFAULT_REGION = "us-east-1"
aws_cluster_name   = "dev-okts"
profile            = "default"

#VPC Vars
aws_vpc_cidr_block       = "172.32.0.0/16"
aws_cidr_subnets_private = ["172.32.0.1/16", "172.32.0.2/16"]
aws_cidr_subnets_public  = ["172.32.0.3/16", "172.32.0.4/16"]

default_tags = {
  Env = "dev-okts"
  Product = "kubernetes"
}

#Bastion Host
aws_bastion_size = "t2.medium"


#Kubernetes Cluster

aws_kube_master_num = 3
aws_kube_master_size = "t2.medium"

aws_etcd_num = 3
aws_etcd_size = "t2.medium"

aws_kube_worker_num = 4
aws_kube_worker_size = "t2.medium"

#Settings AWS ELB

aws_elb_api_port = 6443
k8s_secure_api_port = 6443

kube_insecure_apiserver_address = "0.0.0.0"


inventory_file = "../../../inventory/hosts"
