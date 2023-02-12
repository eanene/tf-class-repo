# tfvars = the values to all the variables in your variable.tf file
module "dev" {
  source = "../class-module/files"
  cidr_block " 10.0.0.0/24"
}
