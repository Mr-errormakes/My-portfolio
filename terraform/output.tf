
output "testec2-1-public-ip" {
  description = "Public IP address of the first EC2 instance"
  value       = aws_instance.testec2-1.public_ip
}

output "testec2-2-public-ip" {
  description = "Public IP address of the second EC2 instance"
  value       = aws_instance.testec2-2.public_ip
}

output "portfolio_url" {
  description = "HTTP URL for the first EC2 instance"
  value       = "http://${aws_instance.testec2-1.public_ip}"
}
