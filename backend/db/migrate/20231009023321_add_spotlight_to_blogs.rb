class AddSpotlightToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :is_spotlight, :boolean, default: false
  end
end
