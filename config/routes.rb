Rails.application.routes.draw do
  resources :game_points
  resources :game_gems
  resources :game_sets
  resources :matches
  get 'matches/index'
  get 'matches/show'
  devise_for :users
  root 'welcome#index'

  get 'dashboard/index'
  get 'dashboard/users'
  
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'

  post 'add_point', to: 'game_points#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
