Rails.application.routes.draw do
  devise_for :admins
  root "pages#index"

  match '/contacts',     to: 'contacts#new', via: 'get'
	resources "contacts", only: [:new, :create]
	
	resources :albums do
		member do
			delete :delete_image_attachment
		end
	end
end
