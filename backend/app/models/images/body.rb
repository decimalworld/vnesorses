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
module Images
  class Body < Image
    DIR = 'blogs'
  end
end
