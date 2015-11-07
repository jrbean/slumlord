Rails.application.routes.draw do
  devise_for :users

  resources :repairs, only: [:create, :new, :show, :update, :index]

  root 'repairs#index'

  post '/manager_mail' => 'mailers#manager_mail'
  post '/tenant_mail' => 'mailers#tenant_mail'
end
