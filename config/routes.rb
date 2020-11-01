# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :teachers, controllers: { registrations: :registrations }, skip: :passwords

  root to: 'courses#index'

  direct(:github) { 'https://github.com/iszandro' }

  resources :courses do
    resources :inscriptions, only: %i[create destroy]
    resources :votes, only: %i[create destroy]
  end

  resources :teachers do
    resources :votes, only: %i[create destroy]
  end
end
