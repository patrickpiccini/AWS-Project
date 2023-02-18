resource "aws_autoscaling_group" "aws_project_asg" {
	name = "${aws_launch_configuration.web_server_tamplate.name}-asg"

	min_size             = 2
	desired_capacity     = 2
	max_size             = 3
	
	health_check_type    = "ELB"
	load_balancers = [
		"${aws_elb.aws_project_elb.id}"
	]

	launch_configuration = "${aws_launch_configuration.web_server_tamplate.id}"
	
	enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  	]
	metrics_granularity = "1Minute"

	vpc_zone_identifier  = [
		"${aws_subnet.public_subnet_sa_east_1a.id}",
		"${aws_subnet.public_subnet_sa_east_1c.id}"
  	]

	lifecycle {
    create_before_destroy = true
  	}

	tag {
		key                 = "Name"
		value               = "web-server"
		propagate_at_launch = true
  	}

}