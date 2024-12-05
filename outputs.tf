output "windows_public_ip" {
  description = "The public IP address of the Windows 10 instance."
  value       = aws_instance.windows10.public_ip
}

output "kali_public_ip" {
  description = "The public IP address of the Kali Linux instance."
  value       = aws_instance.kali_linux.public_ip
}

output "security_tools_private_ip" {
  description = "The private IP address of the Security Tools server."
  value       = aws_instance.security_tools.private_ip
}

output "vpc_id" {
  description = "The ID of the VPC created."
  value       = module.vpc.vpc_id
}

