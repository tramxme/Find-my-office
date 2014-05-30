SearchOh::Application.routes.draw do
  devise_for :users
  get "welcome/index"
  get "/teachers/search" => 'teachers#search'
  resources :teachers 
  root :to => 'welcome#index'
end
