class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	add_flash_types :success,:danger,:info,:warning
	before_action :set_locale

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
		devise_parameter_sanitizer.permit(:account_update, keys: [:username])
	end

	private

	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
	end



	def default_url_options(options = {})
		{locale: I18n.locale}.merge options
	end


	def after_sign_in_path_for(resource)
		request.env['omniauth.origin'] || root_path
	end
end
