Rails.application.routes.draw do
  get '/' => 'welcome#home'
  resources :check_out_logs
  resources :authors
  resources :genres
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
