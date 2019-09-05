Rails.application.routes.draw do
  root to: 'welcome#home'
  resources :check_out_logs
  resources :authors
  resources :genres
  resources :books
  resources :users
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
