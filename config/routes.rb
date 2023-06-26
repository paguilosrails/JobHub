Rails.application.routes.draw do
devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
 }

 resources :positions do
  post 'apply', on: :member
end

  


  # resources :users do
    # get 'new_user_registration', on: :collection
  # end

 
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
