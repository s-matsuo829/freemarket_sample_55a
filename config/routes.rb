Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'
  
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
    :omniauth_callbacks => "users/omniauth_callbacks" 
  }

  resources :users, :only => [:index, :show, :edit] do
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
    end
  end

  resources :items, only: [:index, :new, :show] do
    collection do
      post 'pay/:id' => 'items#pay', as: 'pay'
    end

    member do
      get 'purchase_confirmation'
      get 'payment_complete'
    end
  end

end
