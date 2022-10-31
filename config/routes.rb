Rails.application.routes.draw do
  devise_for :users, controllers: {
    session: 'users/sessions',
    registration: 'users/registrations'
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'search', to: "articles#search"
  resources :articles do 
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  # resources :likes, only: [:create, :destroy]
  root "articles#index"
end
