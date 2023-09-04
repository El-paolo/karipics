class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, images_attributes: [:url, :id]])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, images_attributes:
        [:url, :id]])
        end
end
