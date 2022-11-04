resource "aws_instance" "web" {
  ami           = var.amiID
  instance_type = var.instance_type
  monitoring = true
  ebs_optimized = true
  # root_block_device {
  #   encrypted = true
  # }

  tags = {
    Name = "AirBnB"
  }
}