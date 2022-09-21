resource "aws_s3_bucket" "tf-class-bucket" {
  bucket = "${var.env}-tf-class-bucket"

  tags = {
    Name        =  "${var.env}-tf-class-bucket"
   
  }
}