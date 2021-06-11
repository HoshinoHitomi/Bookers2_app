Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'users/show'
  get 'homes/about'
  resources :books, only: [:index, :new, :create, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
