Rails.application.routes.draw do
  scope :api do
    scope :v1, defaults: { format: :json } do
      devise_for :users
    end
  end
end
