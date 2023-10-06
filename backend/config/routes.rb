# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :blogs, only: %i(create update)
  resources :categories, only: :index
end
