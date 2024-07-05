provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google" {
  alias   = "central1"
  project = var.project_id
  region  = "us-central1"
}

