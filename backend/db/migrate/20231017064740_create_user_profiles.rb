class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles, id: :uuid do |t|
      t.string    :avatar_link, default: ''
      t.string    :name
      t.boolean   :two_fator_auth, default: false
      t.datetime  :date_of_birth
      t.integer   :integer
      t.string    :personal_phone
      t.string    :address
      t.string    :degree
      t.string    :job
      t.string    :level
      t.string    :company_expertise
      t.string    :monthly_income
      t.references :user, type: :uuid, index: true, unique: true
      t.timestamps
    end
  end
end
