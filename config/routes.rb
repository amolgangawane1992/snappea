Rails.application.routes.draw do
  # API routes path
  namespace 'api', defaults:{ format: :json } do
		resources :restaurants do
		  resources :menus do

		  end
	 	end
	 	post 'authenticate', to: 'authentications#authenticate'
  end
    #resources :Authentication do

   # end
  
end