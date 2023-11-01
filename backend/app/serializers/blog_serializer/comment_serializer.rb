# frozen_string_literal: true

module BlogSerializer
  class CommentSerializer < ActiveModel::Serializer
    attributes :user, :content

    def user
      user_object = object.user
      {
        avatar: user_object.avatar.full_path,
        username: user_object.name
      }
    end
  end
end
