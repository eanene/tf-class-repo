data "template_file" "userdata" {
    template = file("${path.module}/files/userdata.tpl")
    vars = {
      region = var.my_region
    }
}

data "template_file" "app_policy" {
    template = file("${path.module}/files/app_policy.json")
    
    
}