class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :images ])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :images ])
    end
    #estos se usan para controlar las autorizaciones
    def authorize_request(kind = nil )
        unless kind.include?(current_user.role)
            redirected_to posts_path, notice:"No estás autorizado par realizar esta accion"
        end
    end
end
