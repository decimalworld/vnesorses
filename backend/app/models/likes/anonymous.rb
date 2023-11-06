# frozen_string_literal: true

module Likes
  class Anonymous < Like
    validates :ip_addr, presence: true
  end
end
