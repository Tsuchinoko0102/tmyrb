Rails.application.routes.draw do
  devise_for :users

  resources :books do
    collection do
      get "rakuten_search"
      post "rakuten_select"
    end
  end
  resources :books, only:[:show] do
    member do
      get "new_pdf"
    end
  end

  root to: "books#index"
  resources :users, only: [:index, :show, :edit, :update]
end
