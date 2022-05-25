Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: "items#index"
  
  resources :users, only: :show do
    member do
      get :favorites
    end
    # get :favorites, on: :collection 
  end
  resources :items do
    resources :comments, only: [:create, :destroy]
      collection do
        get 'search'
      end
      resource :favorites, only: [:create, :destroy]
  end
end
