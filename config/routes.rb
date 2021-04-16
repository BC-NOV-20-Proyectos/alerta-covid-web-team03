Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
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
  resources :places

  post 'institutions/search', :to => 'institutions#search'
  post 'areas/search', :to => 'areas#search'
  post 'symptoms/search', :to => 'symptoms#search'
  post 'admin_users/search', :to => 'admin_users#search'

  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
    resources :test_covids
	  resources :user_history_details
	  resources :user_histories
	  resources :area_histories
	  resources :areas
	  resources :symptoms
	  resources :institutions
    devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    },
    controllers: {
      sessions: 'api/v1/users/sessions'
    }
    resources :places

    post 'institutions/search', :to => 'institutions#search'

    get "password/reset", to: "password_resets#new"
    post "password/reset", to: "password_resets#create"
    get "password/reset/edit", to: "password_resets#edit"
    patch "password/reset/edit", to: "password_resets#update"
    end
  end

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
