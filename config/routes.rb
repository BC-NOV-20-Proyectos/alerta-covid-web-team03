Rails.application.routes.draw do
  resources :test_covids
  resources :user_history_details
  resources :user_histories
  resources :area_histories
  resources :areas
  resources :symptoms
  resources :insititutions
  devise_for :users
  


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
