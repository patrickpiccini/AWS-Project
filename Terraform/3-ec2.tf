
resource "aws_instance" "web_server_1" {
	ami           				= "ami-015e30624fffff117"
	instance_type 				= "t2.micro"
	key_name 					= "testekey"
	subnet_id					= aws_subnet.public_subnet_sa_east_1a.id
	vpc_security_group_ids 		= [aws_security_group.aws_project_sg_ec2.id]
	associate_public_ip_address = true
	private_ip 					= "10.10.10.10"

	user_data = "${file("install_apache.sh")}"

	tags = {
		Name = "aws_project"
		Name = "aws_project_server_1"
	}
}

resource "aws_instance" "web_server_2" {
	ami           				= "ami-015e30624fffff117"
	instance_type 				= "t2.micro"
	key_name 					= "testekey"
	subnet_id 					= aws_subnet.public_subnet_sa_east_1c.id
	vpc_security_group_ids 		= [aws_security_group.aws_project_sg_ec2.id]
	associate_public_ip_address = true
	private_ip 					= "10.10.30.11"


	user_data = "${file("install_apache.sh")}"

	tags = {
		Name = "aws_project"
		Name = "aws_project_server_2"
	}
}

resource "aws_instance" "db_server" {
	ami           				= "ami-015e30624fffff117"
	instance_type 				= "t2.micro"
	key_name 					= "testekey"
	subnet_id 					= aws_subnet.public_subnet_sa_east_1c.id
	vpc_security_group_ids 		= [aws_security_group.aws_project_sg_ec2.id]
	associate_public_ip_address = true
	private_ip 					= "10.10.30.10"


	user_data = "${file("install_apache.sh")}"

	tags = {
		Name = "aws_project"
		Name = "aws_project_db_server"
	}
}
