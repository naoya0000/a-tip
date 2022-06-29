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
  patch '/users/:id/hide', to: 'users#hide', as: 'users_hide'
  
  get 'search', to: 'animes#search'
  resources :animes, only: [:index, :show]
  
  namespace :admin do
    resources :animes, only: [:index, :new, :create, :show, :update, :edit, :destroy]
  end
  
  resources :cards, only: [:new, :create]
  
  get 'tips/thanks', to: 'tips#thanks'
  resources :tips, only: [:create]
  
end
