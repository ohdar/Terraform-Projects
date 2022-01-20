resource "aws_lb" "tcw_alb" {
  name               = "tcw-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-security-group.id]

  # At least two subnets on different Availability Zone must be specified
  subnets                    = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
  enable_deletion_protection = false
  tags = {
    Environment = "dev"
  }
}

#####################################################################
## AWS Target Group
#####################################################################

resource "aws_lb_target_group" "tcw_tg" {
  name     = "tcw-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

#####################################################################
## AWS Load Balancer Listener
#####################################################################

resource "aws_lb_listener" "alb_forward_listener" {
  load_balancer_arn = aws_lb.tcw_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tcw_tg.arn
  }
}