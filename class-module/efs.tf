
resource "aws_efs_file_system" "tf-class-efs" {
  creation_token = "${var.env}-class-efs"

  tags = {
     Name = "${var.env}-class-efs" 
}
}


resource "aws_efs_mount_target" "alpha" {
  for_each = { for x in local.data_subnets : x.id => x.id }
  file_system_id = aws_efs_file_system.tf-class-efs.id
  subnet_id      = each.value 
}
