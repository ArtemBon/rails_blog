Rails.application.routes.draw do
  get 'static_pages/help'
  get 'static_pages/about'

  resources :articles do
    resources :comments
  end

  get "search", to: "search#search"
  
  root 'static_pages#home'
end
