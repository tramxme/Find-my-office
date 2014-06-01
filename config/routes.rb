SearchOh::Application.routes.draw do
  devise_for :users
  get "welcome/index"
  get "/teachers/search" => 'teachers#search'
  resources :institutes do
    resources :teachers, :shallow => true
  end
  root :to => 'welcome#index'
end
