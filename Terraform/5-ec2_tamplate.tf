resource "aws_launch_template" "web_server_tamplate" {
	name      = "web_server_tamplate"

	block_device_mappings {
		device_name = "/dev/xvda"

		ebs {
		volume_size           = 8
		volume_type           = "gp2"
		delete_on_termination = true
		encrypted             = false
		}
	}

	image_id                              = "ami-015e30624fffff117"
	instance_initiated_shutdown_behavior  = "terminate"
	instance_type                         = "t2.micro"
	key_name                              = "testekey"

	network_interfaces {
		associate_public_ip_address     = true
		subnet_id                       = aws_subnet.public_subnet_sa_east_1a.id
	}

	vpc_security_group_ids          = [aws_security_group.aws_project_sg_ec2.id]

	user_data = "${base64encode(file("install_apache.sh"))}"

	tags = {
		Name = "aws_project"
		Name = "aws_project_server_1"
	}
}