resource "aws_launch_template" "tf-class-lt" {
  name = "${var.env}-lt"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 20
    }
  }
  image_id = data.aws_ami.redhat-linux-6.id
  instance_type = "t2.micro"
  iam_instance_profile {
    name = aws_iam_instance_profile.app_profile.name
  }
  

#   key_name = aws_key_pair.tf-class-key.name
  # 
 vpc_security_group_ids = [aws_security_group.app_sg.id]
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.env}-wordpress-instance"
    }
  }

  user_data = base64encode(data.template_file.userdata.rendered)
}