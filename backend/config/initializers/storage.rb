require 'google/cloud/storage'

STORAGE = Google::Cloud::Storage.new(
  project_id: Rails.application.credentials.gcloud.project_id,
  credentials: Rails.application.credentials.gcloud.key_file
)
BUCKET = STORAGE.bucket Rails.application.credentials.gcloud.project_bucket
