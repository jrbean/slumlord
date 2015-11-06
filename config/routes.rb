Rails.application.routes.draw do
  devise_for :users

  resources :repairs, only: [:create, :new, :show, :update, :index]

  root 'repairs#index'

  post '/mail' => 'mailers#manager_mail'
  put '/mail' => 'mailers#tenant_mail'
end
