Rails.application.routes.draw do
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	scope "(:locale)", locale:/ru|en/ do
		root 'campaigns#index'
		resources :campaigns

		resources :tags, only: [:index, :show]
		resources :categories
	end
end
