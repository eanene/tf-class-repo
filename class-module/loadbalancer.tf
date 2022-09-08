resource "aws_lb" "tf-class-lb" {
  name               = "${var.env}-lb"
  internal           = false
  load_balancer_type = "application"
   security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [for subnet in aws_subnet.tf-class-public-subnet : subnet.id]

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.bucket
#     prefix  = "test-lb"
#     enabled = true
#   }

  tags = {
    Environment = "${var.env}"
  }
}