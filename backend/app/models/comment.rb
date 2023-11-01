# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :user

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
end
