Rails.application.routes.draw do
	 devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get 'contacts/upload', to: 'contacts#upload', as: 'upload'
	post 'contacts/import', to: 'contacts#import', as: 'import_create'

  resources :contacts do
		resources :gifts
	end

	resources :lists
	resources :groups
	resources :gifts

	get '/dashboard', to: 'dashboard#index', as: 'dashboard'

	authenticated :user do
		root 'dashboard#index', as: :authenticated_root
	end

	root to: 'pages#home'
end
