Rails.application.routes.draw do
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'

  resources :articles do
    resources :comments
  end

  get "search", to: "search#search"
  
  root 'static_pages#home'
end
