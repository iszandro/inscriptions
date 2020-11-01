# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :teachers, controllers: { registrations: :registrations }, skip: :passwords

  root to: 'courses#index'

  direct(:github) { 'https://github.com/iszandro' }

  resources :courses do
    resources :inscriptions, only: %i[create destroy]
    resources :votes, only: %i[create destroy], defaults: { format: :js }
  end

  resources :teachers, only: :index do
    resources :votes, only: %i[create destroy], defaults: { format: :js }
  end

  resource :profile, only: %i[show update]
end
