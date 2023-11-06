class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, id: :uuid do |t|
      t.references  :user, type: :uuid, null: true, index: true
      t.references  :comment, type: :uuid, null: false, index: true
      t.string      :ip_addr, null: true, length: 50
      t.string      :type, null: true, length: 50 

      t.timestamps
    end
    add_index :likes, :ip_addr
  end
end
