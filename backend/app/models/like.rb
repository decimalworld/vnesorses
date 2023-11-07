# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :comment, optional: false

  scope :by_user, lambda { |user_id: nil, ip_addr: nil|
    relation = where(nil)
    return unless user_id || ip_addr

    relation = relation.where(user_id: user_id) if user_id
    relation = relation.where(ip_addr: ip_addr) if ip_addr
    return relation
  }
end
