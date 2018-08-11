Rails.application.routes.draw do
	 devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :contacts do
		resources :gifts
	end

	get '/gifts', to: 'gifts#index', as: 'gifts'

	root to: 'contacts#index'
end
