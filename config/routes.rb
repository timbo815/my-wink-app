Rails.application.routes.draw do
  root 'sessions#new'
  resource :session, only: [:new, :create, :destroy]
  resource :user
  resources :devices
  resources :lightbulbs
  resources :scenes
end
