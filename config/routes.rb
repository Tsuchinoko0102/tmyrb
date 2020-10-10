Rails.application.routes.draw do
  devise_for :users
  resources :books do
    collection do
      get "rakuten_search"
      post "rakuten_select"
    end
  end
  root to: "books#index"
end
