PostitTemplate::Application.routes.draw do
  root to: 'posts#index', as: 'main'

  get '/register', to: 'users#new'
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  post '/logout', to: 'session#destroy'


  resources :posts, except: [:destroy] do
    resources :comments, only: [:new, :create, :show]
  end

  resources :categories, only: [:new, :create, :show]
  resources :users, only: [:create]
end
