SeatYourself::Application.routes.draw do
 root 'restaurants#index'

 resources :restaurants
 resources :users
end
