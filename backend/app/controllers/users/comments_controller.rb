# frozen_string_literal: true

module Users
  class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      comment = current_user.comments.create!(comment_param)
      render json: json_with_success(
        comment,
        {
          serializer: CommentSerializer
        }
      )
    end

    private

    def comment_param
      params.permit(:blog_id, :content)
    end
  end
end
