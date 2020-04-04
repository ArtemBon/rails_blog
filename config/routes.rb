Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  get "search", to: "search#search"
  
  root 'welcome#index'
end
