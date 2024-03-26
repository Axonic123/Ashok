resource "aws_instance" "aws_ec2_public_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  count                       = var.instance_count
  subnet_id                   = var.subnets_id 
  key_name                    = aws_key_pair.deployer.key_name
  security_groups             = [ aws_security_group.ec2_security_group.id ]
  associate_public_ip_address = true

  user_data = <<-EOF
        #!/bin/bash
        # Add Docker's official GPG key:
        sudo apt-get update
        sudo apt-get install ca-certificates curl
        sudo install -m 0755 -d /etc/apt/keyrings
        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        sudo chmod a+r /etc/apt/keyrings/docker.asc

        # Add the repository to Apt sources:
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update
        sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
        sudo groupadd docker
        sudo usermod -aG docker $USER
        newgrp docker
        sudo apt  install docker-compose -y
        sudo apt install awscli -y
        EOF
tags = {
    Name = element(var.instance_name, count.index)
  }
}

