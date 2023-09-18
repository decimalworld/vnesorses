require 'google/cloud/storage'

begin
  STORAGE = Google::Cloud::Storage.new(
    project_id: Rails.application.credentials.gcloud.project_id,
    credentials: Rails.application.credentials.gcloud.credential_key
  )
  BUCKET = STORAGE.bucket Rails.application.credentials.gcloud.project_bucket
rescue RuntimeError
  STORAGE = ''
  BUCKET = ''
end
