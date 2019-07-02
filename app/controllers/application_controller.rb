class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avatar])
    end

  private
    def after_sign_out_path_for(resource)
      new_user_session_path
    end

    def after_sign_in_path_for(resource)
      reading_path(current_user)
    end

end
