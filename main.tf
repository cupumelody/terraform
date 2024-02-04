terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "cupumel0dy"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  #cloud {
  #  organization = "cupumel0dy"
  #  workspaces {
  # name = "terra-house-1"
  #  }
  #}
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
  
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "Berserk!"
  description = <<DESCRIPTION
"Berserk," the magnum opus of Kentaro Miura, unfolds in a grim medieval world, 
following the tortured journey of Guts, a lone mercenary seeking vengeance against his former comrade 
turned malevolent deity, Griffith. The manga weaves a narrative tapestry of ambition, betrayal, 
and the dark consequences of power, exploring the depths of human nature and morality. 
With intricate storytelling and visceral artwork, "Berserk" delves into the psychological complexities of its characters, 
presenting a nightmarish landscape filled with grotesque creatures that challenge the boundaries of the human psyche.  
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "2adw2.cloudfront.net"
  town = "missingo"
  content_version = 1
}