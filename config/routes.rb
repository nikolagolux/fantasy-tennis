Rails.application.routes.draw do
  resources :posts
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
  get 'welcome/info'
  get 'welcome/contact'

  post 'add_point', to: 'game_points#create'

  get 'blog/home'
  get 'blog/post'
  get 'blog/contact'

  resources :matches

  post 'predaj_match', to: 'matches#predaj_match'
  get 'prvi_igrac_predao_match', to: 'matches#prvi_igrac_predao_match'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
