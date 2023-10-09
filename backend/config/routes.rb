# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  resources :blogs, only: %i(show create update)
  resources :categories, only: :index
  resources :spotlights, only: :index
end
