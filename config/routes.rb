Rails.application.routes.draw do
  root 'book#index'

  resources :books
end
