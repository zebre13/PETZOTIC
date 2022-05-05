Rails.application.routes.draw do

  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets do
    member do
      get :booking
    end
  end
end

# only: %i[index show new create edit update]
