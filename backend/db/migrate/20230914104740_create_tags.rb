class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags, id: :uuid do |t|
      t.string :name, index: { unique: true }
      t.references :category, type: :uuid, index: true
      t.timestamps
    end
  end
end
