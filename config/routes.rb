Rails.application.routes.draw do
  get 'help'      => 'static_pages#help'
  get 'about'     => 'static_pages#about'
  get 'contact'   => 'static_pages#contact'
  get 'signup'    => 'users#new'
  get 'login'     => 'sessions#new'
  post 'login'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :articles do
    resources :comments
  end

  resources :users

  get "search", to: "search#search"
  
  root 'static_pages#home'
end
