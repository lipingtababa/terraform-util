# every resource depends on the volume
resource "aws_ebs_volume" "block"{
	count = 1
	size = 16
	availability_zone = var.az
	tags = { usage = "util" }
}

# It is obvious that this resource depends on the vm instance and the block volume
resource "aws_volume_attachment" "att" {
  count = 1
  device_name = "/dev/sdk"
  volume_id   = "${aws_ebs_volume.block[0].id}"
  instance_id = "${aws_instance.vm[0].id}"
}

# The instance would malfunction if the volume is not attached and mounted properly
# Hence the vm instance would depend on the aws_volume_attachment resource att, which unfortuanately depends on the instance and a cycle is formed
resource "aws_instance" "vm" {

	count = 1

	#Use the Bastion image 
	ami = "ami-044ce7bafd38c675b"
	availability_zone = var.az

	#We need a slightly bigger instance here
	instance_type = var.instance_type

	#It requires that the volume be attached to the instance for the script to mount the volume to the right directory, otherwise the mount would fail quietely
	user_data = "${file("./mount_ebs.sh")}"

	depends_on = [aws_ebs_volume.block,]
}

output "vm_ip"{
	value = "${aws_instance.vm[0].public_ip}"
}

