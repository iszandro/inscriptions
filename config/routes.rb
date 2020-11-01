# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :teachers, controllers: { registrations: :registrations }

  root to: 'courses#index'

  resources :courses do
    resources :inscriptions, only: %i[create destroy]
    resources :votes, only: %i[create destroy]
  end

  resources :teachers do
    resources :votes, only: %i[create destroy]
  end
end
