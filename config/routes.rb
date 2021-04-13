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


    # devise_scope :user do
    #   post '/signup', to: 'registrations#create'
    #   post '/login', to: 'sessions#create'
    #   delete 'logout', to: 'sessions#destroy'
    # end

    post 'institutions/search', :to => 'institutions#search'
    end
  end




end