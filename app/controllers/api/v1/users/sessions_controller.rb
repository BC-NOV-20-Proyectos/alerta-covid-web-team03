# frozen_string_literal: true

class  API::V1::Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
   def new
   end


   #POST /resource/sign_in
   def create
    build_resource
    resource = User.find_for_database_authentication(:email=>params[:user][:email])
    return invalid_login_attempt unless resource
    if resource.valid_password?(params[:user][:password])
      sign_in("user", resource)
      render :json=> {:success=>true, :user=>resource.fullname, :email=>resource.email}
      return
    end
    invalid_login_attempt
   end

  # DELETE /resource/sign_out
  def destroy
    sign_out(resource_name)
  end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
   end
  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end

  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
  end

  def invalid_login_attempt
    render json: "Wrong username or password", status: 401
  end
end
