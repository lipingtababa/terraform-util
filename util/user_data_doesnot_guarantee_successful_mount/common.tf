provider "aws" {
	region = var.region
}

variable "instance_type"{
	#default= "t2.medium"
	default= "t2.micro"
}
variable "region"{
	default = "us-west-2"
}

variable "az"{
	description = "What zvailability Zone you tend to place the resource in?"
	default = "us-west-2a"
}
