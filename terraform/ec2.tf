resource "aws_instance" "servers" {
  count         = var.server_count
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.firewall.id]

  tags = {
    Name = "server-${count.index + 1}"
  }

  user_data = <<-EOF
#!/bin/bash
mkdir -p /home/ubuntu/.ssh
echo '${join("\n", var.public_ssh_keys)}' >> /home/ubuntu/.ssh/authorized_keys
chown -R ubuntu:ubuntu /home/ubuntu/.ssh
chmod 700 /home/ubuntu/.ssh
chmod 600 /home/ubuntu/.ssh/authorized_keys
EOF

}