Rails.application.routes.draw do
  devise_for :users

  resources :repairs, only: [:create, :new, :show, :update, :index]

  root 'repairs#index'

end
