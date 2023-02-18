resource "aws_elb" "aws_project_elb" {
  name = "aws-project-elb-asg"

  security_groups = [
    "${aws_security_group.aws_project_sg_elb.id}"
  ]
  subnets = [
    "${aws_subnet.public_subnet_sa_east_1a.id}",
    "${aws_subnet.public_subnet_sa_east_1c.id}"
  ]

  health_check {
    interval              = 30
    target                = "HTTP:80/" 
    timeout               = 5
    healthy_threshold     = 5
    unhealthy_threshold   = 2
  }

  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "80"
    instance_protocol = "http"
  }
}

# # Create a new load balancer
# resource "aws_lb" "aws_project_elb" {
#   name               = "aws-project-elb"
#   internal           = false
#   load_balancer_type = "application"
#   ip_address_type    =  "ipv4"
#   security_groups    = [aws_security_group.aws_project_sg_elb.id]
#   subnets            = [aws_subnet.public_subnet_sa_east_1a.id,
#                         aws_subnet.public_subnet_sa_east_1b.id,
#                         aws_subnet.public_subnet_sa_east_1c.id]


#   enable_deletion_protection = false 

#   tags = {
#     Name = "aws_project_elb"
#     Name = "aws_project"
#   }
# }


# resource "aws_lb_target_group" "aws_project_tg" {
#   name     = "aws-project-elb-tg"
#   port     = 8080
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.aws_project_vpc.id
#   target_type = "instance"

#   depends_on = [
#     # aws_instance.web_server_1,
#     # aws_instance.web_server_2,
#     aws_instance.db_server]

  
#   health_check {
#     interval              = 30
#     path                  = "/"
#     protocol              = "HTTP"
#     timeout               = 5
#     healthy_threshold     = 5
#     unhealthy_threshold   = 2
#   }

#   tags = {
#     Name = "aws_project"
#   }
# }

# resource "aws_lb_target_group_attachment" "aws_project_tg_attach1" {
#   target_group_arn  = aws_lb_target_group.aws_project_tg.arn
#   target_id         = aws_instance.web_server_1.id
#   port              = 80 
# }

# resource "aws_lb_target_group_attachment" "aws_project_tg_attach2" {
#   target_group_arn  = aws_lb_target_group.aws_project_tg.arn
#   target_id         = aws_instance.web_server_2.id
#   port              = 80
# }

# resource "aws_lb_target_group_attachment" "aws_project_tg_attach3" {
#   target_group_arn  = aws_lb_target_group.aws_project_tg.arn
#   target_id         = aws_instance.db_server.id
#   port              = 80
# }

# resource "aws_lb_listener" "aws_project_lb_lis" {
#   load_balancer_arn = aws_lb.aws_project_elb.arn
#   port              = 80
#   protocol          = "HTTP"
  
  
#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.aws_project_tg.arn
#   }

#   tags = {
#     Name = "aws_project"
#   }
# }



