#Aplication controller for api
class API::V1::ApplicationAPIController < ActionController::Base
  protect_from_forgery with: :null_session


end
