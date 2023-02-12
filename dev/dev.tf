# tfvars = the values to all the variables in your variable.tf file
module "dev" {
  source = "../class-module"

  my_region     = "us-east-1"
  my_cidr_block = "10.0.0.0/16"
  env           = "dev"
  private_data_subnets = {
    priv-1 = {
      cidr              = "10.0.1.0/26"
      name              = "class-data-subnet-1"
      availability_zone = "us-east-1a"
    },
    priv-2 = {
      cidr              = "10.0.2.0/26"
      name              = "class-data-subnet-2"
      availability_zone = "us-east-1b"
    }
  }
  private_app_subnets = {
    priv-3 = {
      cidr              = "10.0.3.0/26"
      name              = "class-app-subnet-3"
      availability_zone = "us-east-1a"
    },
    priv-4 = {
      cidr              = "10.0.4.0/26"
      name              = "class-app-subnet-4"
      availability_zone = "us-east-1b"
    }
  }

  public_subnets = {
    pub-5 = {
      cidr              = "10.0.5.0/26"
      name              = "class-public-subnet-5"
      availability_zone = "us-east-1a"
    },
    pub-6 = {
      cidr              = "10.0.6.0/26"
      name              = "class-public-subnet-6"
      availability_zone = "us-east-1b"
    }
  }
  tf-class-db-names = ["dev-primary", "dev-read-replica"]
  eip_names = [ "eip_1", "eip_2"]


}
