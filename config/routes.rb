Rails.application.routes.draw do
  resources :cards, only: [:new, :index, :create]
  resources :photos, only: [:create]

  root to: 'cards#index'
end
