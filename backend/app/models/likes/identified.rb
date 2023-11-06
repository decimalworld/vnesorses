# frozen_string_literal: true

module Likes
  class Identified < Like
    belongs_to :user, optional: false
  end
end
