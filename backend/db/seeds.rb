# frozen_string_literal: true

Dir[Rails.root.join("db/seeds/#{Rails.env}/*.rb")].each do |seed|
  load seed
end

Dir[Rails.root.join('db/seeds/common/*.rb')].each do |seed|
  load seed
end
