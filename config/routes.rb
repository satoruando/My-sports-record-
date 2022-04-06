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

  #チーム開発カリキュラム詳細設計
  namespace :admin do
    resources :customers, only: [:index, :show, :destroy]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  scope module: :member do
    resources :videos, only: [:index, :show, :destroy]
    resources :users, only: [:show, :edit, :update]
    collection do
        get 'users/unsubscribe'
        get 'users/withdraw'
      end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
