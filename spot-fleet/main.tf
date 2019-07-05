provider "aws" {
  profile    = "${var.profile}"
  region     = "${var.AWS_DEFAULT_REGION}"
}

# Provides an EC2 launch template resource.
# Can be used to create EC2 instances or auto scaling groups.
resource "aws_launch_template" "my_ami_lt" {
  name     = "okts_launch_template"
  image_id = "${var.ami_id}"
  key_name = "${var.key_name}"
  network_interfaces {
  associate_public_ip_address = true
  }
  instance_type = "t2.micro"
  placement {
  availability_zone = "us-east-1a"
  }

  vpc_security_group_ids =  ["sg-0c4144342baff5c79"]


  tag_specifications {
    # Tags of EC2 instances
    resource_type = "instance"

    tags {
      project = "${var.project_tag}"
    }
  }
}

resource "aws_ec2_fleet" "my_ec2_fleet" {
  launch_template_config  {
  launch_template_specification {
    launch_template_id = "${aws_launch_template.my_ami_lt.id}"

    version = "1"
  }

  override = {
    instance_type = "t2.micro"
    weighted_capacity = 1
    max_price = "0.90"
    subnet_id = "subnet-05f2fa9918c902d59"
  }

  override = {
    instance_type = "t2.medium"
    weighted_capacity = 2
    max_price = "0.90"
    subnet_id = "subnet-05f2fa9918c902d59"
  }
}
type = "request"
target_capacity_specification = {
  default_target_capacity_type = "spot"

  on_demand_target_capacity = 1

  spot_target_capacity = 1

  total_target_capacity = 2
}
}
