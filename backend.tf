/*
resource "google_storage_bucket" "tf-bucket" {
  name     = "terraform-statefile-bucket"
  location = "US"
  force_destroy = true

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age = 30
    }
  }
}


terraform {
  backend "gcs" {
    bucket      = "terraform-statefile-bucket"
    prefix      = "terraform/state"
    credentials = "./terraform-gke-keyfile.json"
  }
}

*/