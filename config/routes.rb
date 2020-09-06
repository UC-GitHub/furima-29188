Rails.application.routes.draw do
  get 'items/index'
  root to: "items#index"
  devise_for :users
end


# ChatAppのルーティング↓
# Rails.application.routes.draw do
#   devise_for :users
#   get 'messages/index'
#   root "rooms#index"
#   resources :users, only: [:edit, :update]
#   resources :rooms, only: [:new, :create, :destroy] do
#     resources :messages, only: [:index, :create]
#   end
# end