SeatYourself::Application.routes.draw do
 root 'restaurants#index'

 resources :restaurants
end
