SearchOh::Application.routes.draw do
  get "welcome/index"
  get "/teachers/search" => 'teachers#search'
  resources :teachers 
  root :to => 'welcome#index'
end
