Rails.application.routes.draw do
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  resources :articles do
    resources :comments
  end

  resources :users

  get "search", to: "search#search"
  
  root 'static_pages#home'
end
