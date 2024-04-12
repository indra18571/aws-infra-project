resource "aws_launch_template" "template" {
  name_prefix     = "test"
  image_id        = var.ami
  instance_type   = "t2.micro"
}

resource "aws_autoscaling_group" "autoscale" {
  name                  = "test-autoscaling-group"  
  desired_capacity      = 1
  max_size              = 3
  min_size              = 1
  health_check_type     = "EC2"
  termination_policies  = ["OldestInstance"]
  vpc_zone_identifier   = var.subnet-ids
  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }
}