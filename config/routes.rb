# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :teachers, controllers: { registrations: :registrations }

  root to: 'courses#index'
end
