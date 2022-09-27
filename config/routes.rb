Rails.application.routes.draw do
  get 'checkout', to: 'checkouts#show'
  get 'checkout/success', to: 'checkouts#success'
  get 'members/dashboard'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'search', to: "articles#search"
  resources :articles do 
    resources :comments
  end
  root "articles#index"
end
