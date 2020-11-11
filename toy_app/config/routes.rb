Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
    # new route
    # root 'application#hello'

    # new rute, reroute from hello world to the User's index page
    root 'users#index'
end
