resource "aws_launch_configuration" "web_server_tamplate" {
	name_prefix = "web-server"

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
	security_groups  					  = ["${aws_security_group.aws_project_sg_elb.id}"]
	associate_public_ip_address 		  = true

	user_data = "${base64encode(file("install_apache.sh"))}"

	lifecycle {
    create_before_destroy = true
	}

}