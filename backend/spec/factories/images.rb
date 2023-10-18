# frozen_string_literal: true

# == Schema Information
#
# Table name: images
#
#  id             :uuid             not null, primary key
#  type           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_type :string
#  imageable_id   :uuid
#
FactoryBot.define do
  factory :image do
    type { nil }
    trait :cover do
      imageable factory: %i[blog], strategy: :create
      type { Images::Cover.name }
    end

    trait :body do
      imageable factory: %i[blog], strategy: :create
      type { Images::Body.name }
    end

    trait :avatar do
      imageable factory: %i[blog], strategy: :create
      type { Images::Avatar.name }
    end

    initialize_with { type.present? ? type.constantize.new : Image.new }
  end
end
