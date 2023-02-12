# resource "aws_instance" "bastion" {
#   ami           = data.aws_ami.redhat-linux-6.id
#   instance_type = "t2.micro"

#   tags = {
#     Name = "bastion-host"
#   }
# }
