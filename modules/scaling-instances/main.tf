resource "aws_launch_configuration" "as_conf" {
  name_prefix   = var.alc_name_prefix
  image_id      = var.alc_image_id
  instance_type = var.alc_instance_type

  lifecycle {
    create_before_destroy = true
  }

  security_groups = var.security_groups
}

resource "aws_autoscaling_group" "bar" {
  name                 = var.asg_name
  launch_configuration = aws_launch_configuration.as_conf.name
  min_size             = var.min_size
  max_size             = var.max_size

  lifecycle {
    create_before_destroy = true
  }
}