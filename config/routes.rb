Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  scope '/api/v1', defaults: { format: :json } do
    devise_for :users
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :photos
      resources :users, only: [:show, :update] do
        resources :like, as: :likes, only: :create
      end
      resources :matches, only: [:index, :destroy]
      resources :chat, as: :chats, only: [:index]
      resources :selection_lists, only: :index
    end
  end
end
