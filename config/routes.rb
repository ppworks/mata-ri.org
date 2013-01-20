Zoochat::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "auth" }

  resources :rooms, only: [:index, :show] do
    resource :participants, only: [:create, :destroy]
    resources :chats, only: [:index, :show, :create]
  end
  root :to => 'rooms#index'
end
