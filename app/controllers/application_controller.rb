class ApplicationController < ActionController::API
  acts_as_token_authentication_handler_for User, fallback: :none

  respond_to :json

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :latitude, :longitude])
  end
end
