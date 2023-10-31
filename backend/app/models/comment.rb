# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  enum status: {
    active: 0,
    deactived: 1
  }
end
