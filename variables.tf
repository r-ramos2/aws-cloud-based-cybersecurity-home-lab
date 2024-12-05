variable "region" {
  default = "us-east-2"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "aws_key_name" {
  description = "SSH Public Key Name Created in AWS (keys are unique per region)."
  type        = string
  default     = "US-EAST-2-KEY"
}

variable "windows_ami" {
  description = "AMI ID for Windows 10 instance"
  type        = string
  default     = "ami-060b1c20c93e475fd"
}

variable "kali_ami" {
  description = "AMI ID for Kali Linux instance"
  type        = string
  default     = "ami-0b02670313196539c"
}

variable "security_tools_ami" {
  description = "AMI ID for Security Tools instance"
  type        = string
  default     = "ami-0901bbd9d6e996fb7"
}
