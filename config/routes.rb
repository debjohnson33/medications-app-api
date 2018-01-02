Rails.application.routes.draw do
  
  namespace :api do
  	resources :medications do
  		resources :reviews
  	end
  end
end
