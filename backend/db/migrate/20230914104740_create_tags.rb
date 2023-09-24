class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags, id: :uuid do |t|
      t.string :name
      t.references :category, type: :uuid, index: true
      t.timestamps

      t.index [:name, :category_id], unique: true
    end
  end
end
