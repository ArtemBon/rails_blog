Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  get "search", to: "search#search"
  
  root 'welcome#index'
end
