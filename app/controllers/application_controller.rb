class ApplicationController < ActionController::Base
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, images_attributes: [:url,
        :context, :id]])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, images_attributes:
        [:url, :context, :id]])
        end
end
