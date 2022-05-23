Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  
  resources :users, only: :show
  resources :items do
    resources :comments, only: [:create, :destroy]
      collection do
        get 'search'
      end
  end
end
