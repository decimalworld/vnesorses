class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images, id: :uuid do |t|
      t.references  :blog, type: :uuid, index: true
      t.string      :type
      t.timestamps
    end
  end
end
