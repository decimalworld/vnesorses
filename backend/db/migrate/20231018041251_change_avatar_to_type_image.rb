class ChangeAvatarToTypeImage < ActiveRecord::Migration[7.0]
  def change
    add_reference :images, :imageable, polymorphic: true, type: :uuid, index: true, null: true

    reversible do |dir|
      dir.up do
        Image.where.not(blog_id: nil).update_all("imageable_id = blog_id")
        Image.where.not(blog_id: nil).update_all("imageable_type = 'Blog'")
      end

      dir.down do
        Image.where("imageable_type='Blog'").update_all("blog_id = imageable_id")
      end
    end

    remove_column :user_profiles, :avatar_link, :string, default: ''
    remove_reference :images, :blog, index: true, type: :uuid
  end
end
