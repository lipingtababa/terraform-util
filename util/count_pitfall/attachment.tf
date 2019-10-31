provider "aws" {
  region     = "us-west-2"
}

resource "aws_volume_attachment" "ebs_att2" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.example[0].id}"
  instance_id = "${aws_instance.web[0].id}"
}

resource "aws_volume_attachment" "ebs_att1" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.example[1].id}"
  instance_id = "${aws_instance.web[1].id}"
}

resource "aws_instance" "web" {
  count 	    = 2
  ami               = "ami-21f78e11"
  availability_zone = "us-west-2a"
  instance_type     = "t1.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 1
  count 	    = 2
}

