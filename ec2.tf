resource "aws_instance" "web" {
  ami           = var.amiID
  instance_type = var.instance_type

  tags = {
    Name = "AirBnB"
  }
}