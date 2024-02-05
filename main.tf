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
  cloud {
    organization = "cupumel0dy"
    workspaces {
   name = "terra-house-1"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_berserk_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.berserk.public_path
  bucket_name = var.bucket_name
  content_version = var.berserk.content_version
}

resource "terratowns_home" "home_berserk" {
  name = "Berserk!"
  description = <<DESCRIPTION
"Berserk," the magnum opus of Kentaro Miura, unfolds in a grim medieval world, 
following the tortured journey of Guts, a lone mercenary seeking vengeance against his former comrade 
turned malevolent deity, Griffith. The manga weaves a narrative tapestry of ambition, betrayal, 
and the dark consequences of power, exploring the depths of human nature and morality. 
With intricate storytelling and visceral artwork, "Berserk" delves into the psychological complexities of its characters, 
presenting a nightmarish landscape filled with grotesque creatures that challenge the boundaries of the human psyche.  
DESCRIPTION
  domain_name = module.home_berserk_hosting.domain_name
  town = "missingo"
  content_version = var.berserk.content_version
}

module "home_payday_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.payday.public_path
  bucket_name = var.bucket_name
  content_version = var.payday.content_version
}


resource "terratowns_home" "home_payday" {
  name = "Making your Payday Bar"
  description = <<DESCRIPTION
Since I really like Payday Candy Bar but they cost so much to import into Canada, 
I decide I would see how I could my own Payday Bars, 
and if they are more cost effective. 
DESCRIPTION
  domain_name = module.home_payday_hosting.domain_name
  town = "missingo"
  content_version = var.berserk.content_version
}