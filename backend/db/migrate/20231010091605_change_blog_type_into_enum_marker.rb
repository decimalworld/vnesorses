class ChangeBlogTypeIntoEnumMarker < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :is_spotlight, :boolean, default: false
    add_column :blogs, :blog_type, :integer, default: 0

    add_index :blogs, :blog_type
  end
end
