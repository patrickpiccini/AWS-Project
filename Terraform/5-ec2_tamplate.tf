resource "aws_launch_configuration" "web_server_tamplate" {
	# count 		= "${var.counter}"
	# name      	= "${format("web_server_tamplate", count.index+1)}"

	ebs_block_device {
		device_name = "/dev/xvda"
		volume_size           = 8
		volume_type           = "gp2"
		delete_on_termination = true
		encrypted             = false
	}

	image_id                              = "${var.ami}"
	instance_type                         = "t2.micro"
	key_name                              = "${var.key}"
	security_groups  					  = "${aws_security_group.aws_project_sg_ec2.id}"

	user_data = "${base64encode(file("install_apache.sh"))}"

	lifecycle {
    create_before_destroy = true
	}

	# tags = {
	# 	Name = "aws_project"
	# 	Name = "${format("web_server_tamplate", count.index+1)}"
	# }
}