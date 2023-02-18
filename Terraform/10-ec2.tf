
resource "aws_instance" "web_server_bd" {
	ami           				= "${var.ami}"
	instance_type 				= "t2.micro"
	key_name 					= "${var.key}"
	vpc_security_group_ids 		= [aws_security_group.aws_project_sg_private_ec2.id]
	associate_public_ip_address = true
	private_ip 					= "10.10.30.10"

	user_data = "${file("install_apache.sh")}"

	tags = {
		Name = "aws_project"
		Name = "aws_project_server_1"
	}
}


