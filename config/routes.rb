Blog::Application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :users do
    resources :posts
  end
  resources :sessions
  get 'signup' => 'users#new', as: :signup # signup_path
  get 'login' => 'sessions#new', as: :login # login_path
  get 'logout' => 'sessions#destroy', as: :logout # logout_path
    
  root to: 'welcome#index'
end
