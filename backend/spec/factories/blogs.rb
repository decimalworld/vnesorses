# frozen_string_literal: true

# == Schema Information
#
# Table name: blogs
#
#  id         :uuid             not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :blog do
    title { Faker::Lorem.sentence }
    body  { Faker::Lorem.paragraph }
    transient do
      body_image_count { 1 }
    end

    after(:build) do |blog, evaluator|
      blog.build_cover(attributes_for(:image, :cover))
      evaluator.body_image_count.times do
        blog.images.build(attributes_for(:image, :body))
      end
    end
  end
end
