# frozen_string_literal: true

module BlogService
  class CreateService < BaseService
    attr_reader :blog

    def execute(body_image_count, tag_name)
      ActiveRecord::Base.transaction do
        @blog = Tag
                .find_by!(name: tag_name)
                .blogs
                .create!
        Image.import!(
          [
            *create_images(Images::Body.name, body_image_count),
            *create_images(Images::Cover.name, 1)
          ],
          all_or_none: true
        )

        blog
      end
    end

    private

    def create_images(type, amount)
      [{
        type: type,
        imageable_id: blog.id,
        imageable_type: blog.class.name
      }] * amount.to_i
    end
  end
end
