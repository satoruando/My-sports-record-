Rails.application.routes.draw do
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用
  devise_for :member, skip: [:passwords] ,controllers: {
    registrations: "member/registrations",
    sessions: 'member/sessions'
  }

  root 'homes#index'

  get '/about', to: 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
