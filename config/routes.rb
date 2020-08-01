Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :room_messages
  resources :rooms

  root controller: :rooms, action: :index

end
