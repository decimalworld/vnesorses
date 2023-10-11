# frozen_string_literal: true

# == Schema Information
#
# Table name: images
#
#  id         :uuid             not null, primary key
#  blog_id    :uuid
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Image < ApplicationRecord
  after_destroy :remove_cloud_image

  belongs_to :blog
  attr_reader :signed_url

  def base_path
    cloud_url = Rails.application.credentials.gcloud.base_path
    bucket = Rails.application.credentials.gcloud.project_bucket
    "#{cloud_url}/#{bucket}"
  end

  def full_path
    "#{base_path}/#{file}"
  end

  def file
    "#{self.class::DIR}/#{id}"
  end

  def generate_signed_url
    @signed_url = BUCKET.signed_url file, method: 'PUT', version: 'v4', expires: 5.minutes
  end

  def remove_cloud_image
    BUCKET.file full_path
    file.delete

    Rails.logger.debug { "Deleted #{file.name}" }
  end
end
