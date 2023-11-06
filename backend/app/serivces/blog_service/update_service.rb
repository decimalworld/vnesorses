# frozen_string_literal: true

module BlogService
  class UpdateService < BaseService
    attr_reader :comments, :user_info

    def execute(update_params, ip_addr: nil, user_id: nil)
      @comments = update_params[:comments]
      @user_info = { ip_addr: ip_addr, user_id: user_id }
      Rails.logger.debug @user_info

      update_comments if comments
    end

    private

    def update_comments
      categorized = comments.group_by { |comment| comment[:like] }
      update_like(categorized.fetch(true, {}))
      update_unlikes(categorized.fetch(false, {}))
    end

    def update_like(liked_comments)
      likes =
        Comment
        .find(liked_comments.pluck(:id))
        .map do |comment|
          comment.like_by(**user_info)
        end
      Like.import!(likes, on_duplicate_key_ignore: true)
    end

    def update_unlikes(unlikes_comments)
      Like.where(
        **user_info,
        comment_id: unlikes_comments.pluck(:id)
      ).delete_all
    end
  end
end
