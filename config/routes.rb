Rails.application.routes.draw do
  
  namespace :api do
  	resources :medications
  	resources :reviews
  end
end
