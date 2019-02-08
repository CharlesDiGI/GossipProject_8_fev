Rails.application.routes.draw do
  get 'welcome/:user_entry', to: 'welcome#show_welcome', as: 'welcome'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  # root 'static_pages#home'
  root 'gossips#index'
  resources :gossips
  resources :authors
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
  

  resources :gossips do
    resources :comments
    resources :likes, only: [:new, :create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
