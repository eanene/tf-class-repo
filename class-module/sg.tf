resource "aws_security_group" "lb_sg" {
  name        = "${var.env}load-balancer-sg"
  description = "Allow TLS traffic for load balancer"
  vpc_id      = aws_vpc.tf-class-vpc.id

  tags = {
    Name = "${var.env}-load-balancer-sg"
  }
}
resource "aws_security_group_rule" "internet_1" {
  type              = "ingress"
  from_port         = 443
  to_port           = 65443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lb_sg.id
}
resource "aws_security_group_rule" "internet_2" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id       = aws_security_group.app_sg.id
  security_group_id = aws_security_group.lb_sg.id
}

#################################################

resource "aws_security_group" "app_sg" {
  name        = "${var.env}-app-sg"
  description = "Allow TLS traffic for wordpress application"
  vpc_id      = aws_vpc.tf-class-vpc.id

  tags = {
    Name = "${var.env}-app-sg"
  }
}
resource "aws_security_group_rule" "app_1" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id       = aws_security_group.lb_sg.id
  security_group_id = aws_security_group.app_sg.id
}

resource "aws_security_group_rule" "app_2" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id        = aws_security_group.db_sg.id
  security_group_id = aws_security_group.app_sg.id
}

#################################################

resource "aws_security_group" "db_sg" {
  name        = "${var.env}-db-sg"
  description = "Allow TLS traffic for database"
  vpc_id      = aws_vpc.tf-class-vpc.id

  tags = {
    Name = "${var.env}-db-sg"
  }
}

resource "aws_security_group_rule" "db_1" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id      = aws_security_group.app_sg.id
  security_group_id = aws_security_group.db_sg.id
}
