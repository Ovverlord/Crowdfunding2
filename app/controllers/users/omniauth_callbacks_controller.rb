class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	before_action :configure_sign_up_params, only: [:create]
	before_action :configure_account_update_params, only: [:update]


	def facebook
		@user = User.from_omniauth(request.env["omniauth.auth"])
		sign_in_and_redirect @user      
	end



	def configure_sign_up_params
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
		params.require(:username).permit(:username)
	end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
    	devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :workgroup])
    end
end