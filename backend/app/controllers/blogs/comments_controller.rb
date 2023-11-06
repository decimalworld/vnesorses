# frozen_string_literal: true

module Blogs
  class CommentsController < ApplicationController
    before_action :authenticate_user!, if: :user_authenticatable?

    def show
      render json: json_with_pagination(
        current_blog.comments.includes(:likes).fetch_page(paginate_params),
        {
          current_user: current_user,
          ip_addr: ip_addr,
          each_serializer: BlogSerializer::CommentSerializer
        }
      )
    end

    def update
      BlogService::UpdateService.execute(
        update_params,
        ip_addr: ip_addr,
        user_id: current_user&.id
      )

      render json: json_with_pagination(
        Comment
        .where(id: update_params[:comments].pluck(:id)),
        {
          current_user: current_user,
          ip_addr: ip_addr,
          each_serializer: BlogSerializer::CommentSerializer
        }
      )
    end

    private

    def current_blog
      @current_blog ||= Blog.find(params[:blog_id])
    end

    def update_params
      params.permit(comments: %i[id like])
    end
  end
end
