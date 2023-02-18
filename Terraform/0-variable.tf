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