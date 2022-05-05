Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users
  get '/dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets do
    member do
      get :booking
    end
  end
end

# only: %i[index show new create edit update]
