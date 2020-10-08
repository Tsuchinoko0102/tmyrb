Rails.application.routes.draw do
  devise_for :users
  resources :books do
    collection do
      get "rakuten_search"
    end
  end
  root to: "books#index"
end
