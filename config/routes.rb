PostitTemplate::Application.routes.draw do
  root to: 'posts#index', as: 'main'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'


  resources :posts, except: [:destroy] do
    resources :comments, only: [:new, :create, :show]
  end

  resources :categories, only: [:new, :create, :show]
  resources :users, only: [:create]
end
