
resource "aws_autoscaling_group" "tf-class-" {
  # availability_zones = ["us-east-1a", "us-east-1b"]
  desired_capacity   = 2
  max_size           = 3
  min_size           = 2
  vpc_zone_identifier = concat([for subnet in aws_subnet.tf-class-app-subnet: subnet.id])


  launch_template {
    id      = aws_launch_template.tf-class-lt.id
    version = "$Latest"

  }
}

data "aws_ami" "redhat-linux-6" {
  most_recent = true
  owners      = ["309956199498"]
  filter {
    name   = "name"
    values = ["RHEL-8.6.0_HVM-2*-x86_64-2-Hourly2-GP2"]
  }
}

