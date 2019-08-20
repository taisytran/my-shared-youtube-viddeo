# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get 'home', to: 'home#index'

  # authenticate
  post '/login_or_signup', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # share a video
  resources :sharing_video, only: %i[index create]
end
