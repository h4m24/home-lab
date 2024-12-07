terraform {
  required_providers {
    pihole = {
      source = "ryanwholey/pihole"
    }
  }
}

provider "pihole" {
  url      = "http://10.10.10.30"        # PIHOLE_URL
  password = var.pihole_api_token_secret # PIHOLE_PASSWORD
}



