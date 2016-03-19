Rails.application.routes.draw do
  root to: 'main#home'
  get '/search/', to: 'words#search'
end
