class AddTagReferenceToBlog < ActiveRecord::Migration[7.0]
  def change
    add_index :tags, :name
    add_reference :blogs, :tag, type: :uuid, foreign_key: true, null: true
  end
end
