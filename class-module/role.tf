resource "aws_iam_role" "tf-class-wordpress-role" {
  name = "${var.env}-wordpress-role"
  assume_role_policy = <<EOF
  {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Effect" : "Allow",
        "Sid"    : "forAPP",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        }
      }
    ]
  }
  EOF

}
resource "aws_iam_role_policy" "word-press-app-policy" {
  name        = "${var.env}-wordpress-policy"
  policy = data.template_file.app_policy.rendered
  role = aws_iam_role.tf-class-wordpress-role.name
}

resource "aws_iam_instance_profile" "app_profile" {
  name = "${var.env}-wordpress-instance-profile"
  role = aws_iam_role.tf-class-wordpress-role.name
}
