terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.19.0"
    }
  }
}

provider "google" {
  project = "terraform-416320"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "keys.json"

}

resource google_storage_bucket "gcs1" {
    name = "bucket-from-tf-gcp-sa"
    location = "us-central1"

}