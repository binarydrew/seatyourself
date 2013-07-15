SeatYourself::Application.routes.draw do
 root 'restaurants#index'

 resources :restaurants
 resources :users
 resources :sessions, only: [:new, :create, :destroy]
end
