resource "aws_db_subnet_group" "db_subnet_group" {
  name = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.db_subnet_group_tag_name
  }
}
