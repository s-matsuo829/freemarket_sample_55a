Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'
  
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
    # :omniauth_callbacks => "users/omniauth_callbacks" 
  }

  resources :users, :only => [:index, :show] do
    resources :cards, only: [:new, :create, :show]
    
    resources :addresses, only: [:new, :create, :show]

    collection do
      get 'mypage_identification'
      get 'signup_complete'
    end
  end

  resources :items, only: [:index]

end
