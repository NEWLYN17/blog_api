# config/routes.rb
Rails.application.routes.draw do
  post '/auth/register', to: 'auth#register'
  post '/auth/login', to: 'auth#login'
  
  resources :posts do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end