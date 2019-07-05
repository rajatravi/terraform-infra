variable "profile" {
  type        = "string"
  default     = "default"
}
variable "AWS_DEFAULT_REGION" {
  type        = "string"
  default     = "us-east-1"
}
variable "ami_id" {
  type        = "string"
  default     = "ami-07b4156579ea1d7ba"
}
variable "key_name" {
  type        = "string"
  default     = "okts-key"
}
variable "project_tag" {
  type        = "string"
  default     = "okts"
}
variable "bid_price" {
  type        = "string"
  default     = "0.5"
}
variable "zone" {
  type        = "string"
  default     = "us-east-1a"
}
variable "instance_type" {
  type        = "string"
  default     = "t2.micro"
}
