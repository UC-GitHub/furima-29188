class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
end

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :kana_family_name, :kana_first_name, :birthday])
end





# ChatAppのコントローラー
# class ApplicationController < ActionController::Base
#   before_action :authenticate_user!
#   before_action :configure_permitted_parameters, if: :devise_controller?
# end

# def configure_permitted_parameters
#   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
# end