PostitTemplate::Application.routes.draw do
  root to: 'posts#index', as: 'main'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  resources :posts do
      member do
        post 'vote'
    end



    resources :comments, only: [:new, :create, :show, :vote] do
      member do
        post 'vote'
      end
    end
  end

  resources :categories, only: [:new, :create, :show]
  resources :users, only: [:create]
end
