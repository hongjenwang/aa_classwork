Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'artworks', to: 'artworks#all'

  resources :users, except: [:new, :edit] do
    resources :artworks, only: :index
  end
  resources :artworks, except: [:new, :edit]
  resources :artwork_shares, except: [:new, :edit]
end
