# Create Application Load Balancer
# terraform aws create application load balancer
resource "aws_alb" "application-load-balancer" {
    name                = "my-application-load-balancer"
    internal            = false
    load_balancer_type  = "application"
    security_groups     = [aws_security_group.alb-security-group.id]

    subnet_mapping {
      subnet_id         = aws_subnet.public-subnet-1.id
    }

    subnet_mapping {
      subnet_id         = aws_subnet.public-subnet-2.id
    }

    enable_deletion_protection = false

    tags = {
      Name = "application load balancer"
    }
  
}

# Create Target Group
# terraform aws create target group
resource "aws_alb_target_group" "alb-target-group" {
    name                    = "my-web-server"
    target_type             = "instance"
    port                    = 80
    protocol                = "HTTP"
    vpc_id                  = aws_vpc.vpc.id

    health_check {
      healthy_threshold     = 5
      interval              = 30
      matcher               = "200,300"
      path                  = "/"
      port                  = "traffic-port"
      protocol              = "HTTP"
      timeout               = 5
      unhealthy_threshold   = 2
    }
}

# Create a Listener on Port 80 with Redirect Action
# terraform aws create listner
resource "aws_lb_listener" "alb-listener-no-ssl-certificate" {
    load_balancer_arn       = aws_alb.application-load-balancer.arn
    port                    = "80"
    protocol                = "HTTP"

    default_action {
      type                  = "redirect"

      redirect {
          host              = "#{host}"
          path              = "/#{path}"
          port              = "443"
          protocol          = "HTTPS"
          status_code       = "HTTP_301"
      }
    }  
}

# Create a listener on Port 443 with Forward Action
# terraform aws create listener
resource "aws_lb_listener" "alb-listener-ssl-certificate" {
  load_balancer_arn         = aws_alb.application-load-balancer.arn
  port                      = "443"
  protocol                  = "HTTPS"
  ssl_policy                = "ELBSecurityPolicy-2016-08"
  #certificate_arn           = "${var.ssl-certificate-arn}"

  default_action {
      type                  = "forward"
      target_group_arn      = aws_alb_target_group.alb-target-group.arn
  }
}









