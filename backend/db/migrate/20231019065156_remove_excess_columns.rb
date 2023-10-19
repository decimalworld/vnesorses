class RemoveExcessColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_profiles, :integer, :integer
  end
end
