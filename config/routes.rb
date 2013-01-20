Zoochat::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "auth" }

  resources :rooms, only: [:show] do
    resource :arrives, only: [:create, :destroy]
    resources :chats, only: [:index, :show, :create]
  end
  root :to => 'rooms#index'
end
