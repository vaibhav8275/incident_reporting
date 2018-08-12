Rails.application.routes.draw do
	root 'incidents#index'
  resources :incidents do
		resources :attachments, :only => [:destroy] # support #create and #destroy
  end
  # resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
