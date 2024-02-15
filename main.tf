provider "aws"{
    alias = "east-2"
    region = "us-east-2"
}
provider "aws"{
    alias = "east-1"
    region = "us-east-1"
}

#input variable
variable "ins_type" {
    description = "this is the type of the instance"
    type = string
    default = "t2.micro"
}
variable "ub_ami" {
    description = "this vriable is Ubuntu the ami id"
    type = string
    default = "ami-0c7e203bbcd5a0dc7"
  
}

#output variables
output "ip_add" {
 description = "this returns the ip address" 
 value = aws_instance.mhk.public_ip
}
# when writing tf project, the structure must be split in different tf files 
#provider.tf
#input.tf 
#output.tf 
#main.tf

resource "aws_instance" "mhk" {
  ami = var.ub_ami
  instance_type = var.ins_type
  provider = aws.east-2
}

