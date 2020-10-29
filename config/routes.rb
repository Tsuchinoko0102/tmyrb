Rails.application.routes.draw do
  devise_for :users

  resources :books do
    collection do
      get "rakuten_search"
      post "rakuten_select"
    end
  end
  root to: "users#index"
  resources :users, only: [:index, :show, :edit, :update]
end
