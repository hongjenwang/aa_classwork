Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'artworks', to: 'artworks#all'

  resources :users, except: [:new, :edit] do
    resources :artworks, only: :index
    resources :artwork_shares, only: :index
    resources :comments, only: :index
  end

  resources :artworks, except: [:new, :edit] do
    resources :comments, only: :index
  end

  resources :artwork_shares, only: [:create, :destroy, :index]
  resources :comments, except: [:new, :edit]
end
