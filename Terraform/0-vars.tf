variable "counter" {
 default = 1
 }
variable "region" {
 description = "AWS region for hosting our your network"
 default = "sa-east-1"
}
variable "public_key_path" {
 description = "Enter the path to the SSH Public Key to add to AWS."
 default = "testekey.pem"
}
variable "key" {
 description = "Key name for SSHing into EC2"
 default = "testekey"
}
variable "ami" {
 description = "Base AMI to launch the instances"
 default = "ami-015e30624fffff117"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

# Defining CIDR Block for Subnet
variable "subnet1_cidr" {
  default = "10.10.10.0/24"
}
# Defining CIDR Block for 2d Subnet
variable "subnet2_cidr" {
  default = "10.10.20.0/24"
}