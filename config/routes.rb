Rails.application.routes.draw do
  get 'users/index'
  get 'users/show' => "users#show"
  
  root "users#index"
  
  resources :test_covids
  resources :user_history_details
  resources :user_histories
  resources :area_histories
  resources :areas
  resources :symptoms
  resources :insititutions
  
  devise_for :users, controllers: { registrations: 'users/registrations' }


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :test_covids
	  resources :user_history_details
	  resources :user_histories
	  resources :area_histories
	  resources :areas
	  resources :symptoms
	  resources :insititutions
	  devise_for :users
    end
  end


end
