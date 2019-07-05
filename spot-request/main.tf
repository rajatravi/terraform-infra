provider "aws" {
  version = "~> 1.0"
  profile    = "${var.profile}"
  region     = "${var.AWS_DEFAULT_REGION}"
}

resource "aws_spot_fleet_request" "okts-k8s" {
  iam_fleet_role      = "arn:aws:iam::702037529261:role/aws-ec2-spot-fleet-tagging-role"
  spot_price          = "0.293"
  allocation_strategy = "diversified"
  target_capacity     = 3
  replace_unhealthy_instances  = true
  valid_until         = "2019-11-04T12:00:00Z"
  excess_capacity_termination_policy   = "Default"

  launch_specification {
    instance_type               = "t2.medium"
    ami                         = "ami-07b4156579ea1d7ba"
    key_name                    = "okts-key"
    availability_zone           = "us-east-1a"
    subnet_id                   = "subnet-05f2fa9918c902d59"
    vpc_security_group_ids      = ["sg-0c4144342baff5c79"]
    associate_public_ip_address = true

  }
}
