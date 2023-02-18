data "aws_availability_zones" "all" {}

resource "aws_autoscaling_group" "aws_project_asg" {
	launch_configuration = "${aws_launch_configuration.web_server_tamplate.id}"
	availability_zones = ["${data.aws_availability_zones.all.names}"]
  min_size = 2
  max_size = 3
	load_balancers = ["${aws_elb.aws_project_elb.name}"]
	health_check_type = "ELB"

}