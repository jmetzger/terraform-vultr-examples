terraform {
    required_providers {
        vultr = {
            source = "vultr/vultr"
            version = "2.23.1"
        }
    }
}

provider "vultr" {
    api_key = var.VULTR_API_KEY
}

variable "VULTR_API_KEY" {}
