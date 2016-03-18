Rails.application.routes.draw do
  root to: 'main#home'
  resources :words, only: [:show]
end
