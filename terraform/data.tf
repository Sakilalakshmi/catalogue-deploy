data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.env}/vpc_id"
}

data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/${var.project_name}/${var.env}/catalogue_sg_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.env}/private_subnet_ids"
}

data "aws_ssm_parameter" "app_alb_listener_arn" {
  name = "/${var.project_name}/${var.env}/app_alb_listener_arn"
}

data "aws_ami" "devops_ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}