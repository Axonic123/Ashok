resource "aws_eip" "elastic_ip" {
  tags = {
    Name = "us-east1-eip"
  }
}
