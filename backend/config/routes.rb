# frozen_string_literal: true

Rails.application.routes.draw do
  resources :blogs, only: %i(create update)
  resources :categories, only: :index
end
