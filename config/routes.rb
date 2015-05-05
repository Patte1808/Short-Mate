Rails.application.routes.draw do
  root 'links#new'

  resources :links, only: [:index, :new, :create, :show]
end
