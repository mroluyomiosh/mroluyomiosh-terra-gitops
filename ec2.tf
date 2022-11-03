resource "aws_instance" "web" {
  ami           = var.amiID
  instance_type = var.instance_type
  monitoring = true
  ebs_optimized = true

  tags = {
    Name = "AirBnB"
  }
}