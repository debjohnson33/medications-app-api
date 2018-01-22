Rails.application.routes.draw do
  
  namespace :api do
  	resources :reviews
  	resources :medications do
  		resources :reviews, :onnly =>[:index, :show]
  	end
  end
end
