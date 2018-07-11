Rails.application.routes.draw do
  devise_for :admins
  root "pages#index"

  match '/contacts',     to: 'contacts#new', via: 'get'
	resources "contacts", only: [:new, :create]
  
end
