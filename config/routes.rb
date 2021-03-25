Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :test_covids
  resources :user_history_details
  resources :user_histories
  resources :area_histories
  resources :areas
  resources :symptoms
  resources :institutions
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :admin_users

  post 'institutions/search', :to => 'institutions#search'
  post 'areas/search', :to => 'areas#search'
  post 'symptoms/search', :to => 'symptoms#search'


  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
    resources :test_covids
	  resources :user_history_details
	  resources :user_histories
	  resources :area_histories
	  resources :areas
	  resources :symptoms
	  resources :institutions
	  devise_for :users

    post 'institutions/search', :to => 'institutions#search'
    end
  end


end