class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs, id: :uuid do |t|
      t.string      :title, length: 100
      t.text        :body
      t.timestamps
    end
  end
end
