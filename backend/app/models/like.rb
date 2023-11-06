# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :comment, optional: false

  scope :by_user, ->(user_id: nil, ip_addr: nil) { where(user_id: user_id) }
end
