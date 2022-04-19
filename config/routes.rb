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

  # ゲストログイン
  devise_scope :member do
    post 'member/guest_sign_in', to: 'member/sessions#guest_sign_in'
  end

  root 'homes#top'

  get '/about', to: 'homes#about'

  #チーム開発カリキュラム詳細設計
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
  end

  scope module: :member do
    get "search" => "searches#search"
    resources :videos, only: [:index, :new, :show, :create, :destroy] do
      resource :nices, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update] do
      collection do
        get 'users/unsubscribe'
        patch 'users/withdraw'
      end
      member do
      get :nices
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
