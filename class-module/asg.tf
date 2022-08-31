
# resource "aws_autoscaling_group" "tf-class-" {
#   availability_zones = ["us-east-1a", "us-east-1b"]
#   desired_capacity   = 2
#   max_size           = 3
#   min_size           = 2

#   launch_template {
#     id      = aws_launch_template.foobar.id
#     version = "$Latest"
#   }
# }

# data "aws_ami" "redhat-linux-6" {
#   most_recent = true
#   owners      = ["309956199498"]
#   filter {
#     name   = "name"
#     values = ["RHEL-9.0.0_HVM-2*-x86_64-0-Hourly2-GP2"]
#   }
# }

# resource "aws_launch_template" "tf-class-lt" {
#   name = "${var.dev}-lt"

#   block_device_mappings {
#     device_name = "/dev/sda1"

#     ebs {
#       volume_size = 20
#     }
#   }

#   image_id = data.aws_ami.redhat-linux-6.id

#   instance_type = "t2.micro"

#   key_name = aws_key_pair.tf-class-key.name


#   network_interfaces {
#     associate_public_ip_address = true
#   }

# #   vpc_security_group_ids = ["sg-12345678"]

#   tag_specifications {
#     resource_type = "instance"

#     tags = {
#       Name = "test"
#     }
#   }

#   user_data = filebase64("${path.module}/example.sh")
# }