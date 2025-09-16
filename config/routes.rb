Rails.application.routes.draw do
  resources :user_books
  resources :users
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "user_books#index"
end
