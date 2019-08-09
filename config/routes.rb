Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'
  
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
    :omniauth_callbacks => "users/omniauth_callbacks" 
  }

  # devise_scope :user do
  #   get "sign_in", to: "users/sessions#new"
  #   get "sign_out", to: "users/sessions#destroy" 
  # end

  resources :users, :only => [:show, :edit] do
    resources :cards, only: [:new, :create, :index]
    resources :addresses, only: [:new, :create, :show]

    member do
      get 'mypage_identification'
      get 'telephone_authentication'
    end
    
    collection do
      get 'signup_complete'
      get 'signup'
      get 'logout'
      get 'purchase_confirmation'
    end
  end


  resources :items, only: [:index, :show, :new, :create, :edit, :update] do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'show_all'
    end
  end
end

