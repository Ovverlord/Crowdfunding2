Rails.application.routes.draw do
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	scope "(:locale)", locale:/ru|en/ do
		root 'campaigns#index'
		resources :campaigns do 
			resources :comments
		end

		resources :tags, only: [:index, :show]
		resources :categories, only: [:show]

		namespace :admin do
			resources :categories, except: [:show]
			resources :users
		end

	end
end
