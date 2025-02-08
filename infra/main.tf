terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

#iam
module "iam" {
  source                                 = "./modules/iam"
  project_id                             = var.project_id
  region                                 = var.region
  compute_engine_default_service_account = var.compute_engine_default_service_account
}

#Network
# module "network" {
#   source = "./modules/network"
#   region = var.region
# }

# artifactregistry
module "artifactregistry" {
  source                                 = "./modules/artifactregistry"
  repository_name                        = var.repository_name
  region                                 = var.region
  project_id                             = var.project_id
  compute_engine_default_service_account = var.compute_engine_default_service_account
}

# bash
module "bash" {
  source          = "./modules/bash"
  region          = var.region
  project_id      = var.project_id
  repository_name = var.repository_name
  image_name      = var.image_name
}

# Cloud Run
module "cloudrun" {
  source                = "./modules/cloudrun"
  region                = var.region
  service_account_email = module.iam.service_account_email
  project_id            = var.project_id
  repository_name       = var.repository_name
  image_name            = var.image_name
}
