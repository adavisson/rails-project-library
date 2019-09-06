Rails.application.routes.draw do
  root to: 'welcome#home'
  resources :check_out_logs
  resources :authors
  resources :genres
  resources :books
  resources :users
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  get '/auth/google_oauth2/callback' => 'sessions#create'
  
  # Rewrite to be part of check_out_log_controller
  get '/books/:id/check_out_page' => 'books#check_out_page', as: 'check_out_page'
  post '/books/:id/check_out' => 'books#check_out', as: 'check_out'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
