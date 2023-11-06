# frozen_string_literal: true

module BlogSerializer
  class CommentSerializer < ApplicationSerializer
    attributes :id, :user, :content, :like

    def user
      user_object = object.user
      {
        avatar: user_object.avatar.full_path,
        username: user_object.name
      }
    end

    def like
      @object.liked_by?(ip_addr: ip_addr, user_id: current_user&.id)
    end
  end
end
