# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  has_many :likes, dependent: :destroy

  enum status: {
    active: 0,
    deactived: 1
  }

  def self.paginate_order(order)
    case order
    when /latest/
      { created_at: :desc }
    when /popular/
      { created_at: :asc }
    end
  end

  def like_by(ip_addr: nil, user_id: nil)
    likes.build({
                  ip_addr: ip_addr,
                  user_id: user_id,
                  type: user_id ? Likes::Identified : Likes::Anonymous
                })
  end

  def liked_by?(ip_addr: nil, user_id: nil)
    likes.by_user(user_id: user_id, ip_addr: ip_addr).exists?
  end
end
