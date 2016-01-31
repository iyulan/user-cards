Rails.application.routes.draw do
  resources :cards, only: [:new, :index]

  root to: 'cards#index'
end
