Rails.application.routes.draw do
  get 'requests/show'
  get 'requests/create'
  get 'passengers/show'
  get 'passengers/create'
  get 'passengers/show'
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/create'
  get 'bookings/new'
  get 'miles_profiles/index'
  get 'miles_profiles/show'
  get 'miles_profiles/new'
  get 'miles_profiles/create'
  get 'miles_profiles/edit'
  get 'miles_profiles/update'
  get 'miles_profiles/destroy'
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
