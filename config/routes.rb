Rails.application.routes.draw do
	 devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get 'contacts/upload', to: 'contacts#upload', as: 'upload'
	post 'contacts/import', to: 'contacts#import', as: 'import_create'

  resources :contacts do
		resources :gifts
	end

	resources :lists

	get '/gifts', to: 'gifts#index', as: 'gifts'

	authenticated :user do
		root 'contacts#index', as: :authenticated_root
	end

	root to: 'pages#home'
end
