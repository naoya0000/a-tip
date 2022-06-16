Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'contacts/new', to: 'contacts#new'
  get 'contacts/thanks', to: 'contacts#thanks'
  resources :contacts, only: [:create]
  
  get 'signup', to: 'users#new'
  resources :users, only: [:create]
  
end
