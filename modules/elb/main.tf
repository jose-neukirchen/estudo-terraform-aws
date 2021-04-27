resource "aws_elb" "bar" {
  name               = var.name
  availability_zones = var.azs

  dynamic "access_logs" {
    for_each = var.access_logs
      content{
        bucket        = access_logs.value["bucket"]
        bucket_prefix = access_logs.value["bucket_prefix"]
        interval      = access_logs.value["interval"]
      }
  }

  dynamic "listener" {
    for_each = var.listener
      content{
        instance_port       = listener.value["instance_port"]
        instance_protocol   = listener.value["instance_protocol"]
        lb_port             = listener.value["lb_port"]
        lb_protocol         = listener.value["lb_protocol"]
        ssl_certificate_id  = lookup(listener.value, "ssl_certificate_id", null)
      }
  }

/*   listener {
    instance_port      = 8000
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  } */

  dynamic "health_check" {
    for_each = var.health_check
      content{
        healthy_threshold   = health_check.value["healthy_threshold"]
        unhealthy_threshold = health_check.value["unhealthy_threshold"]
        timeout             = health_check.value["timeout"]
        target              = health_check.value["target"]
        interval            = health_check.value["interval"]
      }
  }
  instances                   = var.instances
  cross_zone_load_balancing   = var.cross_zone_load_balancing
  idle_timeout                = var.idle_timeout
  connection_draining         = var.connection_draining
  connection_draining_timeout = var.connection_draining_timeout

/*   dynamic "tags" {
    for_each = var.tags
      content{
        name = tags.value["name"]
      }
  } */
}