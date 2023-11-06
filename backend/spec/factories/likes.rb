# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    comment
    type { nil }
    ip_addr { Faker::Internet.ip_v4_address }

    trait :anonymous do
      type { Likes::Anonymous.name }
    end

    trait :identified do
      user
      type { Likes::Identified.name }
    end

    initialize_with { type.present? ? type.constantize.new : Like.new }
  end
end
