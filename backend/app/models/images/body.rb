# frozen_string_literal: true

# == Schema Information
#
# Table name: images
#
#  id             :uuid             not null, primary key
#  type           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_type :string
#  imageable_id   :uuid
#
module Images
  class Body < Image
    DIR = 'blogs'
  end
end
