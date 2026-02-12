provider "aws" {
  region = "eu-north-1"
}

data "aws_ami" "my_ami" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
    
  }
}

resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.my_ami.id
  instance_type = "t3.micro"
  
  tags = {
    Name        = "MyWebServer"
    Environment = "Development"
  }
  count = 1
}
