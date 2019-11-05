Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: "pages#dashboard", as: :dashboard

  resources :requests, only: [:show, :edit, :update]
  resources :requests, only: [:create]  #request create must happen after payment create

  resources :miles_profiles, except: [:show]
  resources :bookings, only: [:new, :create] do
    resources :passengers, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
