output "aws_vpc_id" {
  value = "${aws_launch_template.my_ami_lt.id}"
}
