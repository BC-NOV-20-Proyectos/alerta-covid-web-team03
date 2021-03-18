class ApplicationController < ActionController::Base

  def respond_if_is_true_web(format, to, msg, json_action, json_status, json_location)
    format.html { redirect_to to, notice: msg }
    format.json { render json_action, status: json_status, location: json_location }
  end
  
  def respond_if_is_false_web(format, action, status, json_errors, json_status)
    format.html { render action, status: status }
    format.json { render json: json_errors, status: json_status }
  end

  protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :lasname, :control_number)}

        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :lasname, :control_number)}
      end
end
