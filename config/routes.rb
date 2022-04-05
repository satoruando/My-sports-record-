Rails.application.routes.draw do
  devise_for :members

  root 'homes#index'

  get '/about', to: 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
