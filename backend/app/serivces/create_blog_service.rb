# frozen_string_literal: true

class CreateBlogService < BaseService
  def execute(body_image_count, tag_name)
    ActiveRecord::Base.transaction do
      blog = Tag
             .find_by!(name: tag_name)
             .blogs
             .create!
      Image.import!(
        ([{ type: Images::Body.name, blog_id: blog.id }] * body_image_count.to_i)
        .append({ type: Images::Cover.name, blog_id: blog.id }),
        all_or_none: true
      )

      blog
    end
  end
end
