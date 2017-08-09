Rails.application.routes.draw do
  get 'songs/index'

  resources :songs

  resources :users do
    resources :songs
  end

  root 'songs#index'
end
