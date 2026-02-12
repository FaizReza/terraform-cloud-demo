provider "aws" {
region = "eu-north-1"
}

data "aws_ami" "myami" {

owners = ["amazon"]
most_recent = true

filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

}

resource "aws_instance" "myec2" {
  ami    = data.aws_ami.myami.id 
  instance_type = "t3.micro"
}

resource "aws_instance" "myec2-2" {
  ami    = data.aws_ami.myami.id 
  instance_type = "t3.micro"
}
