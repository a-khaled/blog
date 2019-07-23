Rails.application.routes.draw do
  
 resources :posts do
 	resources :comments
 end

 
  get 'pages/home'
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
