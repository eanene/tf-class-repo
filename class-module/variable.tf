variable "my_region" {
    type = string
    description = "the region in which we are deploying to"
    
}

variable "my_cidr_block" {
    type = string 
    description = "my vpc cidr block"
  
}
variable "private_data_subnets" {
    type = map
    description = "private subnets"
}
variable "private_app_subnets" {
    type = map
    description = "private subnets"
}
variable "env" {
    type = string
  
}
variable "tf-class-db-names" {
    type = list(string)
  
}

variable "public_subnets" {
     type = map
    description = "public subnets"
}
  
