Rails.application.routes.draw do
  root 'uploads#index'
  
  resources :uploads
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
