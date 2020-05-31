Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
end
