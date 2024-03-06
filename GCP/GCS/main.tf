resource "google_storage_bucket" "GCS1" {

  name = "terraform-bucket-gcp-gcs-tr"

  storage_class =   "STANDARD"
 
  location = "US-CENTRAL1"

  labels = {

    "env" = "tf-env"
    "dep" = "prod"
  }

  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 5
      
    }
    action {
      type = "SetStorageClass"
      storage_class = "COLDLINE"
      
    }
    
  }

}

resource "google_storage_bucket_object" "index" {
  name = "index page"
  bucket = google_storage_bucket.GCS1.name
  source = "index.html"
  
}