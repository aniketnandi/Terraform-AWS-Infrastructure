output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "ID of the web server security group"
  value       = aws_security_group.web.id
}

output "web_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}

output "web_instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "web_url" {
  description = "URL of the web server"
  value       = "http://${aws_instance.web.public_dns}"
}
