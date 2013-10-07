PostitTemplate::Application.routes.draw do
  root to: 'posts#index', as: 'main'
  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end

  resources :categories, only: [:new, :create, :show]
end
