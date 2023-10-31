class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.references  :user, null: false, type: :uuid, index: true
      t.references  :blog, null: false, type: :uuid, index: true
      t.string      :content, null: false
      t.integer     :status, default: 0
      t.timestamps
    end

    add_column  :blogs, :status, :integer, default: 0
    add_column  :users, :status, :integer, default: 0
  end
end
