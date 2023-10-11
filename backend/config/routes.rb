# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  resources :categories, only: :index
  namespace :blogs do
    resources :commons, only: %i(index show create update)
    resources :spotlights, only: :index
    resources :title_news, only: :index
  end
end
