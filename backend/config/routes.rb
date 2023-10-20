# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  resources :categories, only: :index do
    post :blogs, on: :member
  end
  namespace :blogs do
    resources :commons, only: %i(index show create update)
    resources :spotlights, only: :index
    resources :title_news, only: :index
  end
  namespace :users do
    resource :user_profile, only: :show
    resource :avatar, only: :update
    resource :identity, only: :show
  end
end
