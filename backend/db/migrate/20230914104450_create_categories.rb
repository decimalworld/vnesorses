class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :name, index: { unique: true }
      t.timestamps
    end
  end
end
